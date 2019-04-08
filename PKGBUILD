# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=sdrsharp
pkgver=1.0.0.1457
pkgrel=1
pkgdesc="The most popular SDR program"
arch=('i686' 'x86_64')
url="https://airspy.com"
license=('custom')
depends=('mono' 'portaudio' 'rtl-sdr' 'alsa-lib')
makedepends=('unzip')
source=("sdrsharp.zip::https://www.iz3mez.it/software/SDRSharp/SDRSharp_v${pkgver:(-4)}.zip"
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
md5sums=('9502200562c15b2ecb318a175f2a367e'
         '5e4b80ffe82a62461397e5106f6710e5'
         '4794615b40632d93c2aecd8fdc9c9653'
         '81264312aed7912d6c74d9fbb42484c7'
         '90af32ab874feddd416680f932c6ec3c'
         'baf3d4a8f5c84db62887f976df6933cb'
         '9bc143b4a43e9694fb68573ffa95a6f2'
         'c8154e76dc02b501dfc156f19202ad62'
         '84a012b4ffa33f57e948ebbbb4ead92a'
         '94e2fa174d9858083f2e4949b458bffb'
         'bffd93dd3dedbddcc73d953031fb2098')

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
