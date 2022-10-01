# Maintainer: Valentin Bruch <software@vbruch.eu>
# Select the PDF engine
_use_mupdf=ON  # ON or OFF
_use_poppler=OFF  # ON or OFF
# Select the Qt version
_qt_version_major=6  # 5 or 6

pkgname=beamerpresenter
pkgver=0.2.3
pkgrel=2
pkgdesc="Modular multi-screen pdf presenter"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3' 'GPL3')
# depends and makedepends will be filled based on the PDF engine.
depends=("qt${_qt_version_major}-multimedia")
optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos' 'hicolor-icon-theme: action button icons' "qt${_qt_version_major}-svg: tool button icons")
makedepends=('cmake' "qt${_qt_version_major}-tools")

if [ "${_use_mupdf}" == 'ON' ]
then
    depends+=('jbig2dec' 'openjpeg2' 'gumbo-parser')
    makedepends+=('libmupdf')
elif [ "${_use_mupdf}" == 'OFF' ]
then
    license=('GPL3')
fi

if [ "${_use_poppler}" == 'ON' ]
then
    depends+=("poppler-qt${_qt_version_major}")
fi

if [ "${_qt_version_major}" == "6" ]
then
    makedepends+=('qt6-multimedia-ffmpeg' 'qt6-multimedia-gstreamer')
fi

backup=('etc/xdg/beamerpresenter/beamerpresenter.conf' 'etc/xdg/beamerpresenter/gui.json')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ed4b76e1c51227b538cab4b736113800a1d5069d2131933d56103082c0eb5468')
conflicts=('beamerpresenter')
provides=("beamerpresenter=${pkgver}")

build() {
    mkdir -p "${pkgname}-${pkgver}/build"
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${srcdir}/BeamerPresenter-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DGIT_VERSION=ON \
        -DUSE_POPPLER="${_use_poppler}" \
        -DUSE_MUPDF="${_use_mupdf}" \
        -DUSE_QTPDF=OFF \
        -DUSE_EXTERNAL_RENDERER=OFF \
        -DUSE_MUJS=OFF \
        -DUSE_MUPDF_THIRD=ON \
        -DUSE_GUMBO=ON \
        -DUSE_TRANSLATIONS=ON \
        -DINSTALL_LICENSE=OFF \
        -DQT_VERSION_MAJOR="${_qt_version_major}" \
        -DMUPDF_USE_SYSTEM_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR='/etc'
    cmake --build "${pkgname}-${pkgver}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}/build"
    install -Dm644 "${srcdir}/BeamerPresenter-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
