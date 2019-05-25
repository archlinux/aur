# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=luxcorerender
pkgver=2.2
_rel="beta1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
pkgrel=1
epoch=1
pkgdesc="LuxCoreRender is a physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(oidn openimageio boost-libs blosc embree glfw-x11 gtk3 opencl-icd-loader)
optdepends=("opencl-driver: for gpu acceleration"
            "pyside2: for pyluxcoretools gui")
makedepends=(boost git doxygen cmake pyside2-tools opencl-headers)
conflicts=(luxrays-hg)
provides=(luxrays)
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "python.patch"
        "glfw.patch"
        "boost016900_serialization.patch"
        )
md5sums=('550a4981ec8c1a0c81bf91c6f5ea83f2'
         '8e2fd7337fe6afaf5b2801426837f600'
         'e2a20172b7b7ac92a7002b6218afe327'
         '52f097678654151e2b5427d271a7e69d')

prepare() {
  cd ${srcdir}/LuxCore-${pkgname}_v${_pkgver}
  for patch in ${srcdir}/*.patch; do
    msg2  "apply $patch..."
    patch -Np1 -i $patch
  done
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
