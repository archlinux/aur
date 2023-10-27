# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=jumpy-git
pkgver=0.8.2.r0.g2fd809cd1
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
source=("git+${url}"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'c2c186e92dc268f7a09fb3ca6ce8b047e0296aa10cc54dab16dd6b6f79d6ae0e')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --match "v*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  cp -r "assets" "$pkgdir/opt/${pkgname%-git}/"
  find "$pkgdir/opt/${pkgname%-git}/assets/music/" -type f -exec chmod 444 {} \;
  find "$pkgdir/opt/${pkgname%-git}/assets/player/sounds/" -type f -exec chmod 444 {} \;

  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/lib"
  install -Dm 755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 licenses/LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
