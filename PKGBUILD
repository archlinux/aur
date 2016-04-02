# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=extempore-git
_llvm_version=3.7.0
pkgver=0.6.0
pkgrel=1
pkgdesc="A cyber-physical programming environment for live coding"
arch=('i686' 'x86_64')
url="http://extempore.moso.com.au"
license=('BSD')
depends=('extempore-llvm' 'mesa' 'pcre' 'alsa-lib')
makedepends=('git' 'cmake' 'gcc' 'perl')
optdepends=('jack')
provides=('extempore')
conflicts=('extempore')
source=("git+https://github.com/digego/extempore.git")
md5sums=('SKIP')

pkgver() {
  git --git-dir="$srcdir/extempore/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/extempore/build"
  cd "$srcdir/extempore/build"

  # TODO: fix extended_deps dependencies, they still depend on LLVM.
  # TODO: if BUILD_DEPS=OFF, aot_extended is still built.

  export EXT_LLVM_DIR="/usr/share/extempore/llvm"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DJACK=ON \
        -DBUILD_DEPS=ON \
        ..

  # build extempore
  make
}

package() {
  cd "$srcdir/extempore/build"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 et:
