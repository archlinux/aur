# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-applet-emoji-selector-git
pkgver=0.1.5.r43.g4530c2d
pkgrel=1
pkgdesc="Emoji Selector for COSMIC™️ DE"
arch=('x86_64')
url="https://github.com/bGVia3VjaGVu/cosmic-ext-applet-emoji-selector"
license=('MPL-2.0 AND MIT')
depends=(
  'cosmic-applets'
  'noto-fonts-emoji'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'cosmic-applet-emoji-selector-git'
  'emoji-selector-applet-for-cosmic-git'
)
source=('git+https://github.com/bGVia3VjaGVu/cosmic-ext-applet-emoji-selector.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
