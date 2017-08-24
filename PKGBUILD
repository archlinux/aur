# Contributor: Christian Bühler <christian.buehler@ipoplan.de>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>
_basename=openni2
pkgname=lib32-openni2
pkgver=2.2beta2
_pkgver=2.2-beta2
pkgrel=6
pkgdesc="Open source SDK used for the development of 3D sensing middleware libraries and applications"
arch=('i686' 'x86_64')
url="https://github.com/occipital/OpenNI2"
license=('Apache')
depends=(openni2 lib32-glu)
makedepends=(doxygen java-environment lib32-freeglut)
source=(https://github.com/occipital/OpenNI2/archive/${_pkgver}.tar.gz
        libopenni2.pc)
md5sums=('3f2cd6a64776821fb2837c442539f65b'
         'SKIP')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
elif [ "${CARCH}" = "i686" ]; then
  _platform=x86
else
  _platform=Arm
fi

_cfg=Release

prepare() {
  cd "${srcdir}/OpenNI2-${_pkgver}"
  sed -i s%-mfloat-abi=softfp%% ThirdParty/PSCommon/BuildSystem/Platform.Arm
  
  # https://github.com/OpenNI/OpenNI2/issues/87
  if [[ `java -version 2>&1` == *1.8* ]]
  then
    sed -i "s/cmd = \[javaDocExe, '-d', 'java'\]/cmd = [javaDocExe, '-d', 'java', '-Xdoclint:none']/" Source/Documentation/Runme.py
  fi
}

build() {
  cd "${srcdir}/OpenNI2-${_pkgver}"
  export CC="${CC} -m32"
  export CXX="${CXX} -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  LDFLAGS+=" -pthread -lc"
  make CFG=${_cfg} ALLOW_WARNINGS=1
  make doc
}

package() {

  install -d -m755 "${pkgdir}/usr/lib32/OpenNI2/Drivers"
  cd "${srcdir}/OpenNI2-${_pkgver}/Bin/${_platform}-${_cfg}"
  install *.so "${pkgdir}/usr/lib32"
  cd "${srcdir}/OpenNI2-${_pkgver}/Bin/${_platform}-${_cfg}/OpenNI2/Drivers"
  install *.so "${pkgdir}/usr/lib32/OpenNI2/Drivers"

  cd "${srcdir}/OpenNI2-${_pkgver}/Packaging/Linux"
  sh install.sh

  install -d -m755 "${pkgdir}/usr/lib32/pkgconfig"
  cp "${srcdir}/libopenni2.pc" "${pkgdir}/usr/lib32/pkgconfig/"
}

# vim:set ts=2 sw=2 et:
 
