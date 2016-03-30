# Maintainer: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=texstudio-phonon
_srcname=texstudio
pkgver=2.10.8
pkgrel=1
pkgdesc="Fork of the LaTeX IDE TexMaker. Gives you an environment where you can easily create and manage LaTeX documents. Built with Phonon."
arch=('i686' 'x86_64')
url="http://texstudio.sourceforge.net/"
license=('GPLv2')
depends=('poppler-qt5' 'phonon-qt5' 'qt5-svg' 'qt5-script' 'texlive-core')
makedepends=('sed' 'qt5-tools')
optdepends=('evince: pdf reader', 'okular: alternate pdf reader')
replaces=('texmakerx' 'texstudio')
provides=('texstudio')
install=$pkgname.install
source=("http://downloads.sourceforge.net/${_srcname}/${_srcname}-${pkgver}.tar.gz"
        'archlinux-phonon.patch'
        'qt-5.6.0.patch')
sha256sums=('0a569544ceb0ff92e52ed57a34e8eb12e7a16eef1209320737aef5d5b81b3404'
            '8efdaf94a99e41ea2e5276fca8788e55ae502ee707100e5aeaad0ed05753c8d9'
            '661cf3a6c423c1077f124835655ccca20b79d846926a74ea88688e00b760e175')

build() {
  cd "${srcdir}/${_srcname}${pkgver}"
  # Patch include path for phonon detection on archlinux.
  patch -p1 -d pdfviewer < "${srcdir}"/archlinux-phonon.patch
  # Patch for qt >= 5.6.0.
  patch -p1 < "${srcdir}"/qt-5.6.0.patch
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
