# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=jumpy-git
pkgver=0.5.1.r0.g0cae1a6c
pkgrel=1
pkgdesc="Tactical 2D shooter in fishy pixels style"
arch=('x86_64')
url="https://github.com/fishfolks/jumpy"
license=('MIT' 'Apache')
depends=('pkg-config' 'mesa-libgl' 'alsa-lib' 'systemd-libs' 'libudev.so')
makedepends=('cargo' 'git' 'systemd')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
replaces=("fishfight-git")
source=("git+${url}")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  mkdir -p "$pkgdir/opt/${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/opt/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"

  cp -r "assets" "$pkgdir/opt/${pkgname%-git}/"
  find "$pkgdir/opt/${pkgname%-git}/assets/music/" -type f -exec chmod 444 {} \;
  find "$pkgdir/opt/${pkgname%-git}/assets/player/sounds/" -type f -exec chmod 444 {} \;

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 licenses/LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
