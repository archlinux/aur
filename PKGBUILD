pkgname=morse-git
pkgver=1.0.0.r6.2ff7c31
pkgrel=1
pkgdesc="Learn Morse Code and High Speed Telegraphy."
arch=('x86_64' 'aarch64')
url="https://github.com/teacond/Morse"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'alsa-lib')
makedepends=('meson' 'rust' 'cargo' 'git')
source=('git+https://www.github.com/teacond/Morse.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Morse"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Morse"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Morse" build -Dprofile=default
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

