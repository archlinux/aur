# Maintainer: stiglers-eponym
# Select the PDF engine
_use_mupdf=ON  # ON or OFF
_use_poppler=OFF  # ON or OFF
# Select the Qt version
_qt_version_major=6  # 5 or 6

pkgname=beamerpresenter-git
pkgver=0.2.1_579.7799e03
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')
# depends and makedepends will be filled based on the variables defined at the beginning.
depends=()
optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos' 'hicolor-icon-theme: icons')
makedepends=('cmake' 'git')

if [ ${_qt_version_major} -eq 5 ]
then
    depends+=('qt5-multimedia>=5.9.0')
    optdepends+=('qt5-svg')
elif [ ${_qt_version_major} -eq 6 ]
then
    depends+=('qt6-multimedia>=6.2.0')
    optdepends+=('qt6-svg')
else
    echo "FATAL ERROR: invalid Qt version: ${_qt_version_major}"
    exit 1
fi

if [ ${_use_mupdf} == 'ON' ]
then
    depends=( ${depends[@]} 'jbig2dec' 'openjpeg2' 'gumbo-parser' )
    makedepends=( ${makedepends[@]} 'libmupdf')
elif [ ${_use_mupdf} == 'OFF' ]
then
    license=('GPL3')
fi

if [ ${_use_poppler} == 'ON' ]
then
    depends=( ${depends[@]} "poppler-qt${_qt_version_major}" )
fi

conflicts=('beamerpresenter')
backup=('etc/xdg/beamerpresenter/beamerpresenter.conf' 'etc/xdg/beamerpresenter/gui.json')
install=beamerpresenter.install
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
sha256sums=('SKIP')

pkgver() {
    printf "%s_%s.%s" \
        "$(sed -n 's/^VERSION *= *\([^ ]\+\)$/\1/p' "${srcdir}/BeamerPresenter/beamerpresenter.pro")" \
        "$(git -C "${srcdir}/BeamerPresenter" rev-list --count HEAD)" \
        "$(git -C "${srcdir}/BeamerPresenter" rev-parse --short HEAD)"
}

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${srcdir}/BeamerPresenter" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_POPPLER=${_use_poppler} \
        -DUSE_MUPDF=${_use_mupdf} \
        -DQT_VERSION_MAJOR=${_qt_version_major} \
        -DCREATE_SHARED_LIBRARIES=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc
    make -C "${pkgname}-${pkgver}/build" all
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}
