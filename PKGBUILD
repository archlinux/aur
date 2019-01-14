# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=luxcorerender
pkgver=2.1
#_rel="beta3"
[ -n "${_rel}" ] && _pkgver+=${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
pkgrel=5
epoch=1
pkgdesc="LuxCoreRender is a physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(openimageio boost blosc embree glfw-x11 gtk3 opencl-icd-loader)
optdepends=("opencl-driver: for gpu acceleration"
            "python-pyside: for pyluxcoretools gui")
makedepends=(git doxygen cmake python-pyside-tools opencl-headers)
conflicts=(luxrays-hg)
provides=(luxrays)
options=('!buildflags')
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "python.patch"
        "glfw.patch"
        )
md5sums=('04f51b65e99a9979befae3298206cdac'
         '21b963e5f66d2c8c6a50bebcf9f0fe07'
         '624f2be4cb431f6a4cfcc968d6263ac2')

prepare() {
  cd ${srcdir}/LuxCore-${pkgname}_v${_pkgver}
  msg "python.patch"
  patch -Np1 < ../python.patch
  msg "glfw.patch"
  patch -Np1 < ../glfw.patch
}

build() {
  cd ${srcdir}/LuxCore-${pkgname}_v${_pkgver}
  mkdir -p build && cd build
  cmake -DPYTHON_V=3 ..
  make
}

package() {
  cd ${srcdir}/LuxCore-${pkgname}_v${_pkgver}/build

  install -d -m755 ${pkgdir}/usr/{bin,include,lib}
  install -m755 bin/* ${pkgdir}/usr/bin
  install -m644 lib/* ${pkgdir}/usr/lib
  cp -a ../include ${pkgdir}/usr
  for file in ${pkgdir}/usr/include/*/*.in; do mv $file ${file%.in}; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=`python -c 'import sys;print("/usr/lib/python{}.{}".format(sys.version_info.major,sys.version_info.minor))'`
  install -d -m755 ${pkgdir}/${_pypath}
  mv ${pkgdir}/usr/lib/pyluxcore.so ${pkgdir}/${_pypath}
}

# vim:set ts=2 sw=2 et:
