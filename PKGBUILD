# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime
pkgver=3.0.8
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=(seanime-bin)
depends=('systemd')
makedepends=('go' 'npm' 'nodejs')
source=("https://github.com/5rahim/seanime/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('daa3c5735ecdd42897149d43b7650cb11ef9d0c7460425b1114b21041ce0c394')

prepare() {
  cd "${pkgname}-${pkgver}"
  cd seanime-web
  npm install
  npm run build

  mkdir -p ../web
  cp -r out/* ../web/
  cd ..
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=1
  go build -o seanime -trimpath -ldflags="-s -w"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -m 755 seanime -t "${pkgdir}/opt/${pkgname}/"
  cp -r web "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/seanime" "${pkgdir}/usr/bin/"

  local user=${USER:-root}
  local group=${USER:-root}

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/seanime.service" <<EOF
[Unit]
Description=Seanime Service
After=network.target

[Service]
ExecStart=/usr/bin/seanime
Restart=always
User=$user
Group=$group

[Install]
WantedBy=multi-user.target
EOF
}

post_install() {
  systemctl enable seanime --now
}
