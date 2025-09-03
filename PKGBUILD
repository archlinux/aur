# Maintainer: Petr Kopecky <xkejpi at gmail dot com>

pkgname=abracadabra
_appname=AbracaDABra
pkgver=3.3.1
pkgrel=1
pkgdesc="Abraca DAB radio: DAB/DAB+ Software Defined Radio (SDR)"
arch=("x86_64" "aarch64")
url="https://github.com/KejPi/${_appname}"
license=("MIT")
depends=("faad2" "mpg123" "portaudio" "qt6-multimedia" "qt6-svg" "qt6-imageformats" "qt6-location" "qt6-positioning" "rtl-sdr" "qcustomplot-qt6")
optdepends=("airspy: support for AirSpy devices"
	    "libfdk-aac: support for Fraunhofer AAC codec library" 
            "soapysdr: support for SopaySDR vendor neutral and platform independent SDR support library" 
	    "soapyairspy: Soapy SDR plugin for Airspy" 
	    "soapybladerf: Soapy SDR plugin for bladeRF" 
	    "soapyhackrf: Soapy SDR plugin for HackRF" 
	    "soapyosmo: Soapy SDR plugin for OsmoSDR" 
	    "soapyplutosdr: Soapy SDR plugin for Pluto SDR" 
	    "soapyrtlsdr: Soapy SDR plugin for RTLSDR" 
	    "soapysdrplay: Soapy SDR plugin for SDR Play")
makedepends=("cmake" "gcc" "qt6-tools" "qt6-translations" "qcustomplot")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${_appname}-${pkgver}.tar.gz::https://github.com/KejPi/${_appname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("fd8cca11b0003e812ea53b2cc647c1a42ea73eba5f16f16606de6b790ed5d49d")

build() {
  mkdir -p "${srcdir}/${_appname}-${pkgver}/build"
  cd "${srcdir}/${_appname}-${pkgver}/build"
  cmake "${srcdir}/${_appname}-${pkgver}" -DSOAPYSDR=ON -DAIRSPY=ON -DUSE_FDKAAC=ON -DUSE_SYSTEM_QCUSTOMPLOT=ON -DPROJECT_VERSION_RELEASE=ON 
  make
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
