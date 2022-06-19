# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-git
pkgver=0.19.0.r2.g95f1f45
pkgrel=1
pkgdesc="A hackable, minimal, fast TUI file explorer (git)"
arch=('x86_64')
url="https://github.com/sayanarijit/xplr"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
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
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  cargo build --frozen
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 src/init.lua -t "$pkgdir/usr/share/${pkgname%-git}/examples"
  install -Dm 644 "assets/desktop/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  for i in 128 16 32 64; do
      install -Dm 644 "assets/icon/${pkgname%-git}${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
  done
  install -Dm 644 "assets/icon/${pkgname%-git}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
