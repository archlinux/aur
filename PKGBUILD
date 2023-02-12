# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=sdrsharp
pkgver=1.0.0.1457
pkgrel=1
pkgdesc="The most popular SDR program"
arch=(i686 x86_64)
url="https://airspy.com"
license=(custom)
depends=(mono portaudio rtl-sdr alsa-lib)
makedepends=(unzip)
source=("sdrsharp.zip::https://ftp.desolve.ru/pub/sdrsharp/SDRSharp_v${pkgver:(-4)}.zip"
        "sdrsharp.png"
        "sdrsharp.desktop"
        "adsbspy.png"
        "adsbspy.desktop"
        "airspycalibrate.png"
        "airspycalibrate.desktop"
        "astrospy.png"
        "astrospy.desktop"
        "spectrumspy.png"
        "spectrumspy.desktop")
noextract=("sdrsharp.zip")
sha256sums=('bdf853040110dbd72720cb63b7696d574e3b00d739b17839e8d93cab3e1df400'
            '41fe371981aec9a552b9d1daa1e521586253557aec4ed1e8aa74b92a19da196a'
            '52653241d4d4b0c14095e478c385c2d5ec61d504a4fe14be6aa1cd142b7f352e'
            'dd14889ddfa437cde2ef2c97e423c12b1d9b3496ddbb197de296515a13a8d384'
            '7485acc5bbe8a2871e16897b9c3302d233a1b497ba25724321237ecb06fe95e2'
            'ba8374caa81e49002cf29ad9c35eb97d5d07e1b7d9501e8a029dafaf9a018b35'
            'a50ee3b768c8c985f7eb2c8af2433682ca6a16f1ac2aaa03e596686fa18556e4'
            '690f041e15be0a07a0b9c84db46d2337f0626ddd8e8401aa2fe5fae44dadff9c'
            '044565587b47c48b0f55b6b8ed8f20bebbd3515441913df7c74dbf750428b865'
            '35d796004c61f9172effd458652cce271d3ef01e52041f9962c3bbfc5af37644'
            'a185c7fd423e2e478158aeaa694a8e15bb8ca051c39b1c672b438c0018710258')

prepare() {
  cd "${srcdir}"

  unzip sdrsharp.zip -d sdrsharp
  cd sdrsharp

  rm httpget.exe install-rtlsdr.bat unzip.exe
  mv LICENSE.txt ${srcdir}/LICENSE
}

package() {
  # create directories
  mkdir -p "${pkgdir}"/opt/sdrsharp
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/48x48/apps
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/64x64/apps
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/128x128/apps

  # install stuff
  install -Dm644 "${srcdir}"/sdrsharp/* "${pkgdir}"/opt/sdrsharp

  # fix permissions for config files
  chmod o+w "${pkgdir}"/opt/sdrsharp/*.config

  # link libraries
  cd "${pkgdir}"/opt/sdrsharp
  ln -s /usr/lib/librtlsdr.so librtlsdr.dll
  ln -s /usr/lib/libportaudio.so libportaudio.so

  # compile and optimize executables
  mono --aot --optimize=all --optimize=float32 SDRSharp.exe
  mono --aot --optimize=all --optimize=float32 ADSBSpy.exe
  mono --aot --optimize=all --optimize=float32 AirspyCalibrate.exe
  mono --aot --optimize=all --optimize=float32 AstroSpy.exe
  mono --aot --optimize=all --optimize=float32 SpectrumSpy.exe

  # install icons and desktop entries
  install -Dm644 "${srcdir}"/*.desktop "${pkgdir}"/usr/share/applications
  install -Dm644 "${srcdir}"/adsbspy.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/adsbspy.png
  install -Dm644 "${srcdir}"/airspycalibrate.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/airspycalibrate.png
  install -Dm644 "${srcdir}"/astrospy.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/astrospy.png
  install -Dm644 "${srcdir}"/sdrsharp.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/sdrsharp.png
  install -Dm644 "${srcdir}"/spectrumspy.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/spectrumspy.png

  # install license
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
