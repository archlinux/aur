# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=juce
pkgdesc='Cross-platform C++ framework, including the Projucer C++ editor'
pkgver=5.2.1
pkgrel=2
arch=('i686' 'x86_64')
url='https://www.juce.com/'
license=('custom')
depends=('hicolor-icon-theme' 'webkit2gtk' 'zenity')
makedepends=('freeglut' 'curl' 'jack' 'libxcomposite' 'libxrandr' 'libxcursor' 'libx11' 'libxinerama' 'mesa' 'gtk3')
optdepends=('java-environment: for graddle')
source=('https://d30pueezughrda.cloudfront.net/juce/juce-huckleberry-linux.zip'
        'Projucer.desktop'
        'Projucer.png')
sha256sums=('684b2c600b50b9ac66d5469640b4b8472b969f11ae7352003b8037402057abfb'
            'f57572e3ff616fc349da7f6b581f09becbe469b8111ff7a83ce854be363d5de4'
            'f9ec15bbcb51b24a798f7d56680190e21829b9f6ff101f756beaccf95fbdad86')

build() {
    # Enable GPL mode, comment out if you'd like to keep
    # the original behaviour
    sed -i -e 's/JUCER_ENABLE_GPL_MODE 0/JUCER_ENABLE_GPL_MODE 1/' "${srcdir}/JUCE/extras/Projucer/JuceLibraryCode/AppConfig.h"

    cd "${srcdir}/JUCE/extras/Projucer/Builds/LinuxMakefile/"
    make
}

package() {
    cd "${srcdir}/JUCE/extras/Projucer/Builds/LinuxMakefile/"
    cp "build/Projucer" "${srcdir}/JUCE/"

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/JUCE" "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin"
    ln -s ../../opt/JUCE/Projucer "${pkgdir}/usr/bin/Projucer"

    # cleaning up compiled files before packaging
    cd "${pkgdir}/opt/JUCE/extras/Projucer/Builds/LinuxMakefile/"
    make clean

    install -Dm644 "${srcdir}/Projucer.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Projucer.png"
    install -Dm644 "${srcdir}/Projucer.desktop" "$pkgdir/usr/share/applications/Projucer.desktop"

    install -Dm644 "${srcdir}/JUCE/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
