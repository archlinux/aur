# Maintainer: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=texstudio-qt5
_srcname=texstudio
pkgver=2.9.4
pkgrel=1
pkgdesc="Fork of the LaTeX IDE TexMaker. Gives you an environment where you can easily create and manage LaTeX documents. Built with Phonon."
arch=('i686' 'x86_64')
url="http://texstudio.sourceforge.net/"
license=('GPLv2')
depends=('poppler-qt5' 'phonon-qt5' 'qt5-svg' 'qt5-script')
makedepends=('sed' 'qt5-tools')
optdepends=('evince: pdf reader', 'okular: alternate pdf reader')
replaces=('texmakerx' 'texstudio')
provides=('texstudio')
install=$pkgname.install
source=("http://downloads.sourceforge.net/${_srcname}/${_srcname}-${pkgver}.tar.gz"
        'archlinux-phonon.patch')
md5sums=('398baea51cf9f9f15ab961da09efb263'
         '2b4bd3232e9f92271856f7daa318e6c7')

build() {
  cd "${srcdir}/${_srcname}${pkgver}"
  # Patch include path for phonon detection on archlinux.
  patch -p1 < "${srcdir}"/archlinux-phonon.patch
  # Fix .desktop item.
  sed -i -e '/^Encoding/d' -e "/^Icon/s|=.*|=${_srcname}|" utilities/${_srcname}.desktop
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS+="${CFLAGS}" QMAKE_CXXFLAGS+="${CXXFLAGS}" \
    PHONON=true INCLUDEPATH+="/usr/include/poppler/qt5" \
    CONFIG-="debug" -o Makefile texstudio.pro
  make
}

package() {
  cd "${srcdir}/${_srcname}${pkgver}"
  make INSTALL_ROOT="$pkgdir" install
  for _i in 16 22 32 48 64 128; do
    install -D -m 0644 utilities/${_srcname}${_i}x${_i}.png \
      "${pkgdir}"/usr/share/icons/hicolor/${_i}x${_i}/apps/${_srcname}.png
  done
  install -D -m 0644 utilities/${_srcname}.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_srcname}.svg
}
