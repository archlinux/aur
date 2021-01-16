# Maintainer: danieltetraquark
# based on the PKGBUILD provided in dvanalyzer source
pkgbase=dvanalyzer
pkgname=(dvanalyzer dvanalyzer-gui)
pkgver=1.4.2
pkgrel=1
pkgdesc="a technical quality control and reporting tool that examines DV streams"
arch=(x86_64)
url='https://mediaarea.net/DVAnalyzer'
license=('GPL')
makedepends=('dos2unix')
depends=('libzen' 'libmediainfo')
source=("https://mediaarea.net/download/source/dvanalyzer/$pkgver/dvanalyzer_$pkgver.tar.xz" "fix-compilation.patch")
sha256sums=("dc55d91382fc52470a98f861f30d35c4ac6d1c21285b9332aa950221dc6991e3"
            "46e375e6689372bc11bb7a12b797f8c2de5cf71333a468db6cadaf4510b0e907")


prepare() {
    cd "${srcdir}"/AVPS_DV_Analyzer/

    dos2unix "${srcdir}"/AVPS_DV_Analyzer/Source/Common/Core.cpp

    patch -l -p1 --input "${srcdir}"/fix-compilation.patch

    cd "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/CLI

    sh ./autogen
    ./configure --prefix=/usr

    cd "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/GUI
    sh ./autogen
    CXXFLAGS="-fPIC" ./configure --prefix=/usr
}


build() {
    cd "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/CLI
    make

    cd "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/GUI
    make
}

package_dvanalyzer() {
    pkgdesc="${pkgdesc} (CLI)"

    cd "AVPS_DV_Analyzer/Project/GNU/CLI"
    make DESTDIR="${pkgdir}" install

    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Release/ReadMe_CLI_Linux.txt "${pkgdir}"/usr/share/doc/${pkgname}/ReadMe.txt
    install -D -m 644 "${srcdir}"/AVPS_DV_Analyzer/License.html "${pkgdir}"/usr/share/licenses/$pkgname/License.html
}

package_dvanalyzer-gui() {
    pkgdesc="${pkgdesc} (GUI)"
    depends=('libzen' 'libmediainfo' 'qt5-base')

    cd "AVPS_DV_Analyzer/Project/GNU/GUI"
    make DESTDIR="${pkgdir}" install

    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Release/ReadMe_GUI_Linux.txt "${pkgdir}"/usr/share/doc/${pkgname}/ReadMe.txt
    install -D -m 644 "${srcdir}"/AVPS_DV_Analyzer/License.html "${pkgdir}"/usr/share/licenses/$pkgname/License.html

    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Source/Resource/Image/AVPS/logo_sign_alpha_square.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/dvanalyzer-gui.png
    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Source/Resource/Image/AVPS/logo_sign_alpha_square.png "${pkgdir}"/usr/share/pixmaps/dvanalyzer-gui.png
    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/GUI/dvanalyzer-gui.desktop "${pkgdir}"/usr/share/applications/dvanalyzer-gui.desktop
    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/GUI/dvanalyzer-gui.kde3.desktop "${pkgdir}"/usr/share/apps/konqueror/servicemenus/dvanalyzer-gui.desktop
    install -D -m 0644 "${srcdir}"/AVPS_DV_Analyzer/Project/GNU/GUI/dvanalyzer-gui.kde4.desktop "${pkgdir}"/usr/share/kde4/services/ServiceMenus/dvanalyzer-gui.desktop
}
