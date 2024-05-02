# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi
pkgver=2.11.1
pkgrel=1
epoch=
pkgdesc="A minimalist, self-hosted WakaTime-compatible backend for coding statistics"
arch=("any")
url="https://github.com/muety/wakapi"
license=('GPL-3.0')
groups=()
depends=()
makedepends=(
    go
)
checkdepends=()
optdepends=()
provides=("wakapi")
conflicts=("wakapi-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/muety/wakapi/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f093d2c53e2b172510894f8172e857eff6edc88a9da77f9f2d55caaf7ae5c8c8cd295335e2258319c22627a00d4555d0704e7a1aec5ec017de557fb8bbbbe4b2')
noextract=()
validpgpkeys=()

build() {
  cd "wakapi-$pkgver"
  go build -o wakapi -v
}

check() {
  cd "wakapi-$pkgver"
  go test -v
}

package() {
  cd "wakapi-$pkgver"
  install -Dm755 "wakapi" "$pkgdir/usr/bin/wakapi"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wakapi/LICENSE"
  install -Dm644 "config.default.yml" "$pkgdir/etc/wakapi/config.yml"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cat >"${pkgdir}/usr/lib/systemd/system/wakapi.service" <<EOF
[Unit]
Description=wakapi server
After=network.target

[Service]
ExecStart=wakapi -config /etc/wakapi/config.yml

[Install]
WantedBy=multi-user.target
EOF
}
