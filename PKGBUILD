# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=luxcorerender
pkgver=2.0
pkgrel=3
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
        "glfw.patch"
        "embree.patch"
        "embree.cmake.patch"
        )
md5sums=('0db60d1e436ab4207b0b75e04e86b6ec'
         'c3536b26275f02baf1d23571690f65ec'
         '624f2be4cb431f6a4cfcc968d6263ac2'
         '98872cf35ba87cb23cc045cfcae1b0ed'
         'eba9a9c5d5564a84a70c381a476a4c9c')

prepare() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}/
  patch -Np1 < ../python.patch
  patch -Np1 < ../glfw.patch
  patch -Np1 < ../embree.patch
  patch -Np1 < ../embree.cmake.patch
}

build() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd ${srcdir}/LuxCore-${pkgname}_v${pkgver}/build

  install -d -m755 ${pkgdir}/usr/{bin,include,lib}
  install -m755 bin/* ${pkgdir}/usr/bin
  install -m644 lib/* ${pkgdir}/usr/lib
  cp -a ../include ${pkgdir}/usr

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=`python -c 'import sys;print("/usr/lib/python{}.{}".format(sys.version_info.major,sys.version_info.minor))'`
  install -d -m755 ${pkgdir}/${_pypath}
  mv ${pkgdir}/usr/lib/pyluxcore.so ${pkgdir}/${_pypath}
}

# vim:set ts=2 sw=2 et:
