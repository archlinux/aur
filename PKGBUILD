# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

_pkgname=FishFight
pkgname=fishfight-git
pkgver=0.4.1.r13.g187abc3
pkgrel=1
pkgdesc="A tactical 2D shooter game"
arch=('x86_64')
url="https://github.com/fishfight/FishFight"
license=('MIT' 'Apache')
depends=('pkg-config' 'libx11' 'libxi' 'mesa-libgl' 'alsa-lib' 'systemd-libs' 'libudev.so')
makedepends=('cargo' 'git' 'systemd')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '6c2713551d5f941e296d295942000549525fc72fe1a61507af9328ce98a312d6')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/lib"
  install -Dm 755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  mkdir -p "$pkgdir/opt/${pkgname%-git}"
  cp -r "assets" "mods" "$pkgdir/opt/${pkgname%-git}/"
  find "$pkgdir/opt/${pkgname%-git}/assets/sounds/" -type f -exec chmod 444 {} \;

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 licenses/LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
