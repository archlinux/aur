# Maintainer: stiglers-eponym
# The default configuration installs the MuPDF version.
_renderer=mupdf
pkgname=beamerpresenter-git
pkgver=0.2.0_525.d030727
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')

# Dependencies when using MuPDF:
depends=('jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=('git' 'libmupdf')

optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos')
conflicts=('beamerpresenter')
backup=("etc/xdg/beamerpresenter/beamerpresenter.conf" "etc/xdg/beamerpresenter/gui.json")
install=beamerpresenter.install
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
sha256sums=('SKIP')

# Change depends and makedepends if poppler is used as renderer.
if [ "${_renderer}" == "poppler" ]; then
    # Dependencies when using poppler:
    depends=('poppler-qt5' 'qt5-multimedia' 'hicolor-icon-theme')
    makedepends=('git')
fi

pkgver() {
  cd "${srcdir}/BeamerPresenter"
  printf "%s_%s.%s" \
	  "$(sed -n 's/^VERSION *= *\([^ ]\+\)$/\1/p' beamerpresenter.pro)" \
	  "$(git rev-list --count HEAD)" \
	  "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/BeamerPresenter"
  qmake RENDERER="${_renderer}" && make
}

package() {
  cd "${srcdir}/BeamerPresenter"
  make install INSTALL_ROOT="${pkgdir}"
}
