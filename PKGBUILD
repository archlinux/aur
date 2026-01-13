# Maintainer: Tymur Smyr <godlyfast@gmail.com>

pkgname=roon-mpris-multizone-git
pkgver=r28.g85b8834
pkgrel=1
pkgdesc="Multi-zone MPRIS bridge for Roon - control all zones via media keys"
arch=('any')
url="https://github.com/godlyfast/roon-mpris"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('roon-mpris')
conflicts=('roon-mpris' 'roon-mpris-bridge-git')
source=("${pkgname}::git+https://github.com/godlyfast/roon-mpris.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  npm install --omit=dev
}

package() {
  cd "$srcdir/$pkgname"

  # Install to node_modules
  install -dm755 "$pkgdir/usr/lib/node_modules/$pkgname"
  cp -r index.js package.json node_modules "$pkgdir/usr/lib/node_modules/$pkgname/"

  # Create executable wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/roon-mpris" <<'EOF'
#!/usr/bin/env bash
exec node /usr/lib/node_modules/roon-mpris-multizone-git/index.js "$@"
EOF

  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Systemd user service
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/roon-mpris.service" <<'EOF'
[Unit]
Description=Roon MPRIS Multi-Zone Bridge
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/roon-mpris
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF
}
