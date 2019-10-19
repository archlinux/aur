# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=luxcorerender
pkgver=2.2
#_rel="rc1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
pkgrel=2
epoch=2
pkgdesc="LuxCoreRender is a physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(oidn openimageio boost-libs blosc embree glfw gtk3 opencl-icd-loader)
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
sha256sums=('35b74e5d3e682dc2826d939c66a1c225354c5eb137c86f10930d1caf70a4629b'
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
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info[0],version_info[1]))")
  cd ${srcdir}/LuxCore-${pkgname}_v${_pkgver}
  mkdir -p build && cd build
  cmake -DPYTHON_V=${_pyver} ..
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
