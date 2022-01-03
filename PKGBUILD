# Maintainer: Valentin Bruch <software@vbruch.eu>
# Select the PDF engine
_use_mupdf=ON  # ON or OFF
_use_poppler=OFF  # ON or OFF
# Select the Qt version
_qt_version_major=6  # 5 or 6

pkgname=beamerpresenter-git
pkgver=0.2.2_beta2_598.933573a
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')
# depends and makedepends will be filled based on the PDF engine.
depends=("qt${_qt_version_major}-multimedia")
optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos' 'hicolor-icon-theme: action button icons' "qt${_qt_version_major}-svg: tool button icons")
makedepends=('cmake' 'git' "qt${_qt_version_major}-tools")

if [ ${_use_mupdf} == 'ON' ]
then
    depends+=('jbig2dec' 'openjpeg2' 'gumbo-parser')
    makedepends+=('libmupdf')
elif [ ${_use_mupdf} == 'OFF' ]
then
    license=('GPL3')
fi

if [ ${_use_poppler} == 'ON' ]
then
    depends+=("poppler-qt${_qt_version_major}")
fi

backup=('etc/xdg/beamerpresenter/beamerpresenter.conf' 'etc/xdg/beamerpresenter/gui.json')
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
sha256sums=('SKIP')

pkgver() {
    printf "0.2.2_beta2_%s.%s" \
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
        -DUSE_MUJS=OFF \
        -DUSE_GUMBO=ON \
        -DUSE_TRANSLATIONS=ON \
        -DQT_VERSION_MAJOR="${_qt_version_major}" \
        -DCREATE_SHARED_LIBRARIES=OFF \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR='/etc'
    cmake --build "${pkgname}-${pkgver}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}/build"
}
