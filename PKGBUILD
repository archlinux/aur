# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=extempore-git
_llvm_version=3.7.0
pkgver=0.6.0
pkgrel=1
pkgdesc="A cyber-physical programming environment for live coding"
arch=('i686' 'x86_64')
url="http://extempore.moso.com.au"
license=('BSD')
depends=('mesa' 'pcre' 'alsa-lib')
makedepends=('git' 'cmake' 'gcc' 'perl')
optdepends=('jack')
provides=('extempore')
conflicts=('extempore')
source=("git+https://github.com/digego/extempore.git")
md5sums=('SKIP')

pkgver() {
  git --git-dir="${srcdir}/extempore/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  # TODO: do not build aot on the install target
  # TODO: fix extended_deps dependencies, they still depend on LLVM.
  # TODO: if BUILD_DEPS=OFF, aot_extended is still built.
  # TODO: make install does not install anything besides the main binary.

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DJACK=ON \
        -DBUILD_DEPS=ON \
        ../extempore

  # build extempore
  make
  make aot_extended
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}


# vim:set ts=2 sw=2 et:
