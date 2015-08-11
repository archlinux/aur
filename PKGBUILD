# Maintainer: Tim Besard <tim.besard@gmail.com>

pkgname=openscam-git
pkgver=20150219.82c83a2
pkgrel=1
pkgdesc="Open-Source software which can simulate 3-axis NC machining. It is a fast, flexible and user friendly simulation software for the DIY and Open-Source community."
arch=('i686' 'x86_64')
url="http://www.openscam.com/"
license=('GPL2')
depends=('boost-libs' 'qt4' 'cairo' 'v8-3.15' 'glu')
makedepends=('scons' 'boost')
optdepends=()
source=(cbang::git+https://github.com/CauldronDevelopmentLLC/cbang
        openscam::git+https://github.com/CauldronDevelopmentLLC/OpenSCAM)
md5sums=('SKIP'
         'SKIP')

build() {
  cd "${srcdir}"

  # Explicitly specify gnu compiler, because otherwise it may use the Intel
  # compiler (if installed), which has a different boost, and causes problems.
  # Note that this takes $MAKEFLAGS with the intention of specifying -j only,
  # other args may confuse scons.

  scons $MAKEFLAGS -C cbang compiler=gnu
  export CBANG_HOME=${srcdir}/cbang

  scons $MAKEFLAGS -C openscam compiler=gnu
}

package() {
  cd "${srcdir}/openscam"
  scons install compiler=gnu install_prefix="$pkgdir/usr/"
}
