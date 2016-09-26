# Maintainer: Martin Wiechmann <mwiechmann [at] techfak [dot] uni-bielefeld [dot] de>

pkgname=texstudio-qt4
_srcname=texstudio
pkgver=2.11.2
pkgrel=1
pkgdesc="Fork of the LaTeX IDE TexMaker. Gives you an environment where you can easily create and manage LaTeX documents. Built with Qt4."
arch=('i686' 'x86_64')
url="http://texstudio.sourceforge.net/"
license=('GPLv2')
depends=('poppler-qt4' 'texlive-core' 'qt4')
makedepends=('sed' 'mercurial')
optdepends=('evince: pdf reader', 'okular: alternate pdf reader')
replaces=('texmakerx' 'texstudio' 'texstudio-qt4-hg')
provides=('texstudio')
install=$pkgname.install
source=("${pkgname}::hg+http://hg.code.sf.net/p/texstudio/hg#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  # Fix .desktop item.
  sed -i -e '/^Encoding/d' -e "/^Icon/s|=.*|=${_srcname}|" utilities/${_srcname}.desktop
  qmake-qt4 PREFIX=/usr QMAKE_CFLAGS+="${CFLAGS}" QMAKE_CXXFLAGS+="${CXXFLAGS}" \
    INCLUDEPATH+="/usr/include/poppler/qt4" \
    CONFIG-="debug" -o Makefile texstudio.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
  for _i in 16 22 32 48 64 128; do
    install -D -m 0644 utilities/${_srcname}${_i}x${_i}.png \
      "${pkgdir}"/usr/share/icons/hicolor/${_i}x${_i}/apps/${_srcname}.png
  done
  install -D -m 0644 utilities/${_srcname}.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_srcname}.svg
}
