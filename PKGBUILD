# Maintainer: Valentin Bruch <software@vbruch.eu>
# The default configuration installs the MuPDF version with Qt 5.
_renderer=mupdf
pkgname=beamerpresenter
pkgver=0.2.1
pkgrel=2
pkgdesc="Modular multi-screen pdf presenter"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')

# Dependencies when using MuPDF:
depends=('jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt5-multimedia')
# For Qt 6:
#depends=('jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt6-multimedia>=6.2.0' 'hicolor-icon-theme')
makedepends=('libmupdf')

optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos' 'hicolor-icon-theme: action button icons' 'qt5-svg: tool button icons')
# For Qt 6:
#optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos' 'hicolor-icon-theme: action button icons' 'qt6-svg: tool button icons')

conflicts=('beamerpresenter-git')
backup=("etc/xdg/${pkgname}/${pkgname}.conf" "etc/xdg/${pkgname}/gui.json")
install=beamerpresenter.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3876bea71907aa64766cff6f7da6fd3bb50a89325e8dba64618a594e1749ed42')

# Change depends and makedepends if poppler is used as renderer.
if [ "${_renderer}" == "poppler" ]; then
    # Dependencies when using poppler:
    depends=('poppler-qt5' 'qt5-multimedia' 'hicolor-icon-theme')
    # For Qt 6:
    #depends=('poppler-qt6' 'qt6-multimedia>=6.2.0' 'hicolor-icon-theme')
    makedepends=()
fi

build() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"
  qmake -config release RENDERER="${_renderer}" && make
  # For Qt 6:
  #qmake6 -config release RENDERER="${_renderer}" && make
}

package() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
