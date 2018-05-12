# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=luxcorerender
pkgver=2.0
pkgrel=2
pkgdesc="LuxCoreRender is a physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(openimageio boost blosc embree glfw-x11 gtk3 opencl-icd-loader)
optdepends=("opencl-dirver: for gpu acceleration"
            "python-pyside: for pyluxcoretools gui")
makedepends=(git doxygen cmake python-pyside-tools opencl-headers)
conflicts=(luxrays-hg)
provides=(luxrays)
options=('!buildflags')
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${pkgver}.tar.gz"
        "python.patch"
        )
md5sums=('0db60d1e436ab4207b0b75e04e86b6ec'
         'c3536b26275f02baf1d23571690f65ec')

prepare() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}/
  patch -Np1 < ../python.patch
}

build() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}/
#  mkdir -p build
#  cd build
  cmake -DBUILD_SHARED_LIBS=ON .
  make
# remove local glfw-x11 library, will be removed when swiched to sys deps
  rm lib/libglfw*
}

package() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}/

  install -d -m755 "$pkgdir"/usr/{bin,include,lib}
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 lib/* "$pkgdir"/usr/lib
  cp -a include "$pkgdir"/usr

  # install pyluxcore to the Python search path
  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  install -d -m755 "$pkgdir/$_pypath"
  mv "$pkgdir"/usr/lib/pyluxcore.so "$pkgdir/$_pypath"
}

# vim:set ts=2 sw=2 et:
