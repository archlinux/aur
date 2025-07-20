# Maintainer: 
# Contributor: raininja < dandenkijin at gmail dot com>
# Contributor: Andy Russell <arussell123@gmail.com>
pkgname=fm-relm4-git
pkgver=r143.5ae63b8
pkgrel=1
pkgdesc="Small, general purpose file manager built with GTK4."
arch=('x86_64')
url="https://github.com/euclio/fm"
license=('MIT')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libpanel'
  'poppler-glib'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/euclio/fm.git')
sha256sums=('SKIP')

pkgver() {
  cd fm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd fm
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd fm
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd fm
  install -Dm755 target/release/fm "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
