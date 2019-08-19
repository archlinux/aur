# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=juce
pkgdesc='Cross-platform C++ framework, including the Projucer C++ editor'
pkgver=5.4.4
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.juce.com/'
license=('custom')
depends=('hicolor-icon-theme' 'webkit2gtk' 'zenity')
makedepends=('freeglut' 'curl' 'jack' 'libxcomposite' 'libxrandr' 'libxcursor' 'libx11' 'libxinerama' 'mesa' 'gtk3')
optdepends=('java-environment: for graddle')
source=("https://github.com/WeAreROLI/JUCE/archive/${pkgver}.tar.gz"
        "Projucer.desktop"
        "Projucer.png")
sha256sums=('40536c5792002ceec09faea8d5a57d5c17486f8805c5efe3bc734e27d2df2202'
            'f57572e3ff616fc349da7f6b581f09becbe469b8111ff7a83ce854be363d5de4'
            'f9ec15bbcb51b24a798f7d56680190e21829b9f6ff101f756beaccf95fbdad86')

build() {
    # Enable GPL mode, comment out if you'd like to keep
    # the original behaviour
    sed -i -e 's/JUCER_ENABLE_GPL_MODE 0/JUCER_ENABLE_GPL_MODE 1/' "${srcdir}/JUCE-${pkgver}/extras/Projucer/JuceLibraryCode/AppConfig.h"

    cd "${srcdir}/JUCE-${pkgver}/extras/Projucer/Builds/LinuxMakefile/"
    make
}

package() {
    cd "${srcdir}/JUCE-${pkgver}/extras/Projucer/Builds/LinuxMakefile/"
    cp "build/Projucer" "${srcdir}/JUCE-${pkgver}/"

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/JUCE-${pkgver}" "${pkgdir}/opt/JUCE"
    install -d "${pkgdir}/usr/bin"
    ln -s ../../opt/JUCE/Projucer "${pkgdir}/usr/bin/Projucer"

    # cleaning up compiled files before packaging
    cd "${pkgdir}/opt/JUCE/extras/Projucer/Builds/LinuxMakefile/"
    make clean

    install -Dm644 "${srcdir}/Projucer.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Projucer.png"
    install -Dm644 "${srcdir}/Projucer.desktop" "$pkgdir/usr/share/applications/Projucer.desktop"

    install -Dm644 "${srcdir}/JUCE-${pkgver}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
