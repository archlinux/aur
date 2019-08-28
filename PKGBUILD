# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=luxcorerender
pkgver=2.2
_rel="beta3"
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
sha256sums=('db638c6dad5ece75184fb48c9abb386f411e65db1968a02f85b2b07f949cb843'
            '0f4e0cb6c5a693c815553cfc25e8a497cf7164b02cca0b4a5351be1b5371bf2e'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            '495d183aef045e53ec8c53aa08cdcc082fb4e69ccb0857693cb0cf2684db0760')

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
