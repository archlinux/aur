# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=sdrsharp
pkgver=1.0.0.1457
pkgrel=5
pkgdesc="The most popular SDR program"
arch=(i686 x86_64)
url="https://airspy.com"
license=(LicenseRef-SDRSharp) # It's basically identical to MS-RSL (which may not be suitable for binaries)
depends=(alsa-lib bash hicolor-icon-theme mono portaudio rtl-sdr)
makedepends=(icoutils unzip)
_sdrsharp="${pkgname}-${pkgver}"
source=("${_sdrsharp}.zip::https://www.iz3mez.it/software/SDRSharp/SDRSharp_v${pkgver:(-4)}.zip"
        "sdrsharp_wrapper"
        "${pkgname}.desktop"
        "adsbspy.desktop"
        "airspycalibrate.desktop"
        "astrospy.desktop"
        "spectrumspy.desktop")
noextract=("${_sdrsharp}.zip")
sha256sums=('bdf853040110dbd72720cb63b7696d574e3b00d739b17839e8d93cab3e1df400'
            'd8e93aeec307a66d1c61f4b54385a85de2f239f6cfc7f38e9b92d85e5a8a40cb'
            '38e7208e368cb27df6bb639e650726d057739bf88638a2536a32f540721a588f'
            '1501543afc7475bed9f790398aa9a8c3bb70da3750a6de02a946a9b744e2a668'
            'cfb7f32fcba96f47e770c6388819d4d88c7565afae5734cbb16e85f0742843d3'
            '886ea5ebcfef1d738a258317347cfeebc004ffa7831c91e792d4b84be8844fc8'
            '93363a6df201bf73834ded017874485188898c11122cf8a22f30e2a8f6377b08')
install="${pkgname}.install"

prepare() {
  echo "Extracting SDRSharp archive..."
  unzip -q -o ${_sdrsharp}.zip -d ${_sdrsharp}
  cd ${_sdrsharp}

  rm httpget.exe install-rtlsdr.bat unzip.exe
}

build() {
  mkdir build || true

  # compile and optimize executables
  mono --aot --optimize=all ${_sdrsharp}/*.exe
  mv ${_sdrsharp}/*.exe.so build
}

package() {
  # install stuff
  install -Dm644 "${srcdir}"/${_sdrsharp}/* -t "${pkgdir}"/opt/${pkgname}
  install -Dm644 "${srcdir}"/build/*.exe.so "${pkgdir}"/opt/${pkgname} || true

  cd "${pkgdir}"/opt/${pkgname}

  # link libraries
  ln -s /usr/lib/librtlsdr.so librtlsdr.dll
  ln -s /usr/lib/libportaudio.so libportaudio.so

  # extract/install the icons
  for app in AirspyCalibrate AstroSpy SDRSharp SpectrumSpy; do
    wrestool -x -t14 ${app}.exe | icotool -x -w 64 -o - - | install -Dm644 \
      /dev/stdin "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/${app}.png
  done
  wrestool -x -t14 ADSBSpy.exe | icotool -x -w 48 -o - - | install -Dm644 \
    /dev/stdin "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/ADSBSpy.png

  # install the config files
  install -Dm644 *.exe.config -t "${pkgdir}"/usr/share/${pkgname}

  # install wrapper stuff/desktop entries
  install -Dm755 "${srcdir}"/sdrsharp_wrapper -t "${pkgdir}"/usr/bin
  for app in ADSBSpy AirspyCalibrate AstroSpy SDRSharp SpectrumSpy; do
    [ ${app} = ADSBSpy ] || ln -sf /tmp/${app}.exe.config "${pkgdir}"/opt/${pkgname}/${app}.exe.config
    ln -s sdrsharp_wrapper "${pkgdir}"/usr/bin/${app}
    ln -s ${app} "${pkgdir}"/usr/bin/${app,,}
  done
  install -Dm644 "${srcdir}"/*.desktop -t "${pkgdir}"/usr/share/applications

  # install license
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
