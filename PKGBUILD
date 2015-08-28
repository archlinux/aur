# Contributor: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=openni2
pkgver=2.2beta2
_pkgver=2.2-beta2
pkgrel=5
pkgdesc="Open source SDK used for the development of 3D sensing middleware libraries and applications"
arch=('i686' 'x86_64')
url="https://github.com/OpenNI/OpenNI2"
license=('Apache')
depends=(glu)
makedepends=(doxygen java-environment freeglut)
source=(https://github.com/OpenNI/OpenNI2/archive/${_pkgver}.tar.gz
        libopenni2.pc)
md5sums=('3f2cd6a64776821fb2837c442539f65b'
         '37b0b6a6932f94269fdff88ace4d8844')

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
  LDFLAGS+=" -pthread -lc"
  make CFG=${_cfg} ALLOW_WARNINGS=1
  make doc
}

package() {
  install -d -m755 "${pkgdir}/etc/ld.so.conf.d"
  echo /usr/lib/OpenNI2/Drivers > "${pkgdir}/etc/ld.so.conf.d/openni2.conf"

  cp -r "${srcdir}/OpenNI2-${_pkgver}/Config" "${pkgdir}/etc/OpenNI2"

  install -d -m755 "${pkgdir}/usr/"{bin,lib/OpenNI2/Drivers,share/doc/OpenNI2}

  cp -r "${srcdir}/OpenNI2-${_pkgver}/Include" "${pkgdir}/usr/include"

  cd "${srcdir}/OpenNI2-${_pkgver}/Bin/${_platform}-${_cfg}"
  install *.so "${pkgdir}/usr/lib"
  install ClosestPointViewer EventBasedRead MultiDepthViewer MultipleStreamRead MWClosestPointApp NiViewer PS1080Console PSLinkConsole SimpleRead SimpleViewer "${pkgdir}/usr/bin"

  cd "${srcdir}/OpenNI2-${_pkgver}/Bin/${_platform}-${_cfg}/OpenNI2/Drivers"
  install *.so "${pkgdir}/usr/lib/OpenNI2/Drivers"

  cd "${srcdir}/OpenNI2-${_pkgver}/Source/Documentation/html"
  install * "${pkgdir}/usr/share/doc/OpenNI2"

  cd "${srcdir}/OpenNI2-${_pkgver}/Packaging/Linux"
  sed -i s%/etc/udev/rules.d/%${pkgdir}/etc/udev/rules.d/% install.sh
  install -d -m755 "${pkgdir}/etc/udev/rules.d"
  sh install.sh

  install -d -m755 "${pkgdir}/usr/lib/pkgconfig"
  cp "${srcdir}/libopenni2.pc" "${pkgdir}/usr/lib/pkgconfig/"
}

# vim:set ts=2 sw=2 et:
