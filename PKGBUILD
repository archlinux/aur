# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Hammer <topo20@protonmail.com>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20251107.15113
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL3')
depends=('perl' 'guile1.8' 'texlive-core' 'python' 'libxext' 'freetype2'
	 'qt6-svg' 'hicolor-icon-theme' 'gawk')
optdepends=('transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking'
            'inkscape: svg convertion'
            'python-lxml: inkscape editting')
makedepends=('ghostscript' 'gcc' 'subversion')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src")
sha256sums=('SKIP')
options=('!ccache')
provides=('texmacs')
conflicts=('texmacs')
LANG=C

pkgver() {
  cd ${_pkgname}
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  cd ${_pkgname}
  #sed -e 's/-Wno-deprecated-register//' -i src/CMakeLists.txt # Remove wrong flag on Linux

  svn patch ../../00-emacs-override-active-region.patch
}

build() {
  cd ${_pkgname}

  # cmake -Bbuild \
  #       -DCMAKE_BUILD_TYPE=RELEASE \
  #       -DCMAKE_INSTALL_PREFIX=/usr 

  # autotools seems to have trouble with qt if QT_QPA_PLATFORM is not set:
  # qt.qpa.wayland: Wayland does not support QWindow::requestActivate()

  # check XDG_SESSION_TYPE and set QT_QPA_PLATFORM correspondingly
  # this problem disappears in later tests

  ./configure --prefix=/usr --with-guile=/usr/bin/guile-config1.8 \
              CC=gcc CXX=g++ QMAKE=/usr/bin/qmake6 
  make clean
  make -j8
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install

  install -D -m 644 "$pkgdir"/usr/share/TeXmacs/misc/mime/texmacs.xml  "$pkgdir"/usr/share/mime/packages/texmacs.xml
  install -D -m 644 "$pkgdir"/usr/share/TeXmacs/misc/mime/texmacs.desktop  "$pkgdir"/usr/share/applications/texmacs.desktop 
  #sed -i 's/texmacs.bin/texmacs.bin -platform xcb/' "$pkgdir"/usr/bin/texmacs

  # fix fig2ps script
  #sed -i 's|${prefix}|/usr|' "$pkgdir"/usr/bin/fig2ps
  # fix FS#37518
  #sed -i '/^Path=/d' "$pkgdir"/usr/share/applications/texmacs.desktop
}

# vim:set ts=2 sw=2 et:
