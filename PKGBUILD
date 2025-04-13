# Maintainer: Kimiblock Moe

pkgname="matrix-authentication-service"
pkgver=0.14.1
pkgrel=1
pkgdesc='Authentication service for Matrix Synapse'
arch=('x86_64')
url="https://github.com/element-hq/$pkgname"
license=('AGPL-3.0-or-later')
provides=('mas-cli')
depends=()
options=(!lto)
backup=('etc/matrix-authentication-service/config.yaml')
makedepends=(
  'nodejs'
  'rust'
  'opa'
  'npm'
  'git'
)
source=(
  "$pkgname::git+$url.git#tag=v${pkgver}"
)

build() {
  cd "$pkgname"
  cd frontend
  npm ci
  npm run build
  cd ../policies
  make
  cd ..
  cargo build --release
}

function package() {
    echo '''[Unit]
Description=Matrix Authentication Service
After=network.target
RequiresMountsFor=/var/lib/private/matrix-authentication-service

[Service]
DynamicUser=yes
Environment=HOME=/var/lib/private/matrix-authentication-service
LoadCredential=config.yaml:/etc/matrix-authentication-service/config.yaml
WorkingDirectory=/usr/share/matrix-authentication-service
ExecStart=bash -c "ln -sfr ${CREDENTIALS_DIRECTORY}/* /var/tmp/ && /usr/bin/mas-cli server --migrate --no-worker -c /var/tmp/config.yaml & && /usr/bin/mas-cli worker -c /var/tmp/config.yaml"
Restart=on-failure
PrivateTmp=disconnected
NoNewPrivileges=yes
StateDirectory=matrix-authentication-service

[Install]
WantedBy=multi-user.target''' >systemd.service

    install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    cd "$pkgname"
    install -vd "$pkgdir/etc/$pkgname"
    install -vd "$pkgdir/usr/share/$pkgname/frontend"
    
    cp -R frontend/dist "$pkgdir/usr/share/$pkgname/frontend"
    cp -R policies templates translations "$pkgdir/usr/share/$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/mas-cli
    cd "${pkgdir}/usr/share/matrix-authentication-service"
    "${pkgdir}/usr/bin/mas-cli" config generate >${pkgdir}/etc/matrix-authentication-service/config.yaml
    chmod 700 ${pkgdir}/etc/matrix-authentication-service/config.yaml
}

sha256sums=('4a69903668f18bd2eca590b8e70f069ba072450428ac05a07578e8b2014b2445')
