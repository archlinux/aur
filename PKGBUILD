# Maintainer: Andrew DeMaria <lostonamountain@gmail.com>
pkgname=openni2-libfreenect
pkgver=2.2beta2
_pkgver=2.2-beta2
pkgrel=4
pkgdesc="Open source SDK used for the development of 3D sensing middleware libraries and applications"
arch=('i686' 'x86_64')
url="http://www.openni.org/"
license=('Apache')
provides=('openni2')
conflicts=('openni2')
makedepends=(doxygen java-environment-common)
depends=(freeglut)
source=(
  "https://github.com/OpenNI/OpenNI2/archive/${_pkgver}.tar.gz"
  "git+https://github.com/OpenKinect/libfreenect.git"
)
md5sums=(
  '3f2cd6a64776821fb2837c442539f65b'
  'SKIP'
)

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
}

build() {
  cd "${srcdir}/OpenNI2-${_pkgver}"
  LDFLAGS+=" -pthread"
  make CFG=${_cfg} ALLOW_WARNINGS=1

  # Couldn't get this to work.
  # make doc

  # build libfreenect backend
  cd "${srcdir}/libfreenect"
  mkdir build && cd build
  cmake .. -DBUILD_OPENNI2_DRIVER=ON
  make
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

  # install libfreenect driver
  cd "${srcdir}/libfreenect/build/lib/OpenNI2-FreenectDriver"
  install libFreenectDriver.so "${pkgdir}/usr/lib/OpenNI2/Drivers"

  cd "${srcdir}/OpenNI2-${_pkgver}/Packaging/Linux"
  sed -i s%/etc/udev/rules.d/%${pkgdir}/etc/udev/rules.d/% install.sh
  install -d -m755 "${pkgdir}/etc/udev/rules.d"
  sh install.sh
}

# vim:set ts=2 sw=2 et:
