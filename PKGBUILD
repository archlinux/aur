# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=miro-git
pkgver=0.2.0.r52.g85e14d1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator written in Rust (git)"
arch=('x86_64')
url="https://github.com/o2sh/miro"
license=('GPL3')
depends=('libxcb' 'xcb-util-keysyms' 'libxkbcommon'
         'libxkbcommon-x11' 'xcb-util-wm' 'mesa'
         'freetype2' 'fontconfig')
makedepends=('cargo' 'git' 'python')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
	"assets-path.patch")
sha512sums=('SKIP'
            '272b70c68ab89ef23b185c794c6affedfdd07170322c8ba950ec3fe79844e025e59064f67d995cfd34f1fda64de51c087719ad2aff882db5d2e5fa7da5ae9e17')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/assets-path.patch"
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
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/opt/${pkgname%-git}"
  cp -r "assets" "$pkgdir/opt/${pkgname%-git}/"
}
