# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=cheerp-git
pkgver=3.0.r251.gc245c83
pkgrel=3
epoch=
pkgdesc="A C++ compiler for the Web"
arch=("x86_64")
url="https://labs.leaningtech.com/cheerp"
license=('Apache-2.0')
groups=()
depends=()
makedepends=("cmake" "ninja" "clang" "lld" "python")
checkdepends=()
optdepends=()
provides=("cheerp")
conflicts=("cheerp")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/leaningtech/cheerp-compiler.git"
  "git+https://github.com/leaningtech/cheerp-utils.git"
  "git+https://github.com/leaningtech/cheerp-musl.git"
  "git+https://github.com/leaningtech/cheerp-libs.git"
)
md5sums=('SKIP'
   'SKIP'
   'SKIP'
   'SKIP'
  )

pkgver() {
  cd "$srcdir/cheerp-compiler"
  git describe --long --tags --abbrev=7 | sed 's/^cheerp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/cheerp-compiler"
  ln -sf ../cheerp-utils
  ln -sf ../cheerp-musl
  ln -sf ../cheerp-libs
  sed -i 's/use-ld=ld/use-ld=lld/g' debian/build.sh
}

build() {
  cd $srcdir/cheerp-compiler/
  # NOTE: some flag injected from makepkg's defaults was making the linker use
  # an insane amount of memory. So for now I am disabling them all
  export CFLAGS=
  export CXXFLAGS=
  export LDFLAGS=
  export MAKEFLAGS=
  ./debian/build.sh all
}

package() {
  cd $srcdir/cheerp-compiler/

  CHEERP_DEST=$pkgdir ./debian/build.sh install
}
