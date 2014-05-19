_name=SensorKinect
pkgname=sensorkinect
pkgver=0.93.5.1.2.1
_pkgver=0.93-5.1.2.1
pkgrel=1
pkgdesc="PrimeSensor Modules for OpenNI"
arch=('i686' 'x86_64')
url="https://github.com/avin2/SensorKinect"
license=('GPL')
depends=('openni')
conflicts=('sensorkinect-git')
install=sensorkinect.install
source=("${_name}.tar.gz::https://github.com/avin2/${_name}/archive/v${_pkgver}.tar.gz"
        "XnSensorDepthGenerator.patch")
md5sums=('de701b5bd7a7ee087c1078c777564bfa'
         '618ad209969f870a43d628e80ac835fd')

pkgver() {
  echo ${_pkgver} | sed 's/-/./'
}

build() {
  # apply patch
  cd "$srcdir/$_name-$_pkgver"
  patch -p1 -i ${srcdir}/XnSensorDepthGenerator.patch

  cd "$srcdir/$_name-$_pkgver/Platform/Linux/Build"
  make NI_CONF_DIR=/etc
}

package() {
  install -d -m755 ${pkgdir}/usr/{lib,bin}

  cd $srcdir/$_name-$_pkgver/Platform/Linux/Bin/
  [[ "${CARCH}" = "x86_64" ]] && cd x64-Release || cd x86-Release
  install XnSensorServer ${pkgdir}/usr/bin
  install libXnCore.so libXnDDK.so libXnDeviceFile.so libXnDeviceSensorV2KM.so libXnFormats.so ${pkgdir}/usr/lib
  chmod +s ${pkgdir}/usr/bin/XnSensorServer

  cd $srcdir/$_name-$_pkgver/Platform/Linux/Install
  install -d -m755 ${pkgdir}/etc/udev/rules.d
  sed -i 's/SYSFS/ATTR/g' 55-primesense-usb.rules
  install 55-primesense-usb.rules ${pkgdir}/etc/udev/rules.d

  cd $srcdir/$_name-$_pkgver/Data
  install -d -m755 ${pkgdir}/etc/primesense
  install GlobalDefaultsKinect.ini ${pkgdir}/etc/primesense

  install -d -m777 ${pkgdir}/var/log/primesense/XnSensorServer
}
