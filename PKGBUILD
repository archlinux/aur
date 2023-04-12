# Maintainer: Valentin Bruch <software@vbruch.eu>
# Select the PDF engine
_use_mupdf=ON  # ON or OFF
_use_poppler=OFF  # ON or OFF
# Select the Qt version
_qt_version_major=6  # 5 or 6

pkgname=beamerpresenter-git
pkgver=0.2.3_856.2be50e4
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3' 'GPL3')
# depends and makedepends will be filled based on the PDF engine.
depends=("qt${_qt_version_major}-multimedia" "qt${_qt_version_major}-svg")
optdepends=('hicolor-icon-theme: action button icons')
makedepends=('cmake' 'git' "qt${_qt_version_major}-tools")
backup=('etc/xdg/beamerpresenter/beamerpresenter.conf' 'etc/xdg/beamerpresenter/gui.json')
source=('git+https://github.com/stiglers-eponym/BeamerPresenter.git')
sha256sums=('SKIP')

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

if [ "${_qt_version_major}" == "5" ]
then
    optdepends+=('gst-libav: show videos' 'gst-plugins-good: show videos')
fi


pkgver() {
    printf "0.2.3_%s.%s" \
        "$(git -C "${srcdir}/BeamerPresenter" rev-list --count HEAD)" \
        "$(git -C "${srcdir}/BeamerPresenter" rev-parse --short HEAD)"
}

conflicts=('beamerpresenter')
provides=("beamerpresenter=${pkgver}")

build() {
    mkdir -p "${pkgname}-${pkgver}/build"
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${srcdir}/BeamerPresenter" \
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
    install -Dm644 "${srcdir}/BeamerPresenter/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
