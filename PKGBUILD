
# Maintainer: Attila Greguss <floyd0122@gmail.com>
pkgname=cosmic-ext-applet-sysinfo-git
pkgver=r4.c4c0c57
pkgrel=1
pkgdesc="Sysinfo for the COSMIC™ desktop"
arch=('x86_64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-sysinfo"
license=('GPL-3.0')
depends=(
	'cosmic-applets'
	'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+https://github.com/cosmic-utils/cosmic-ext-applet-sysinfo.git"
  'justfile.patch'
)
sha256sums=(
  'SKIP'
  'c7c31f941b9b4379af15070d0a77622156c1459746a2d8f8ff9bd35fd12b16d2'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  patch -Np1 -i ../justfile.patch
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
