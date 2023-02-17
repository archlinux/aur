# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20230201.14110
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL3')
depends=('perl' 'guile1.8' 'texlive-core' 'python' 'libxext' 'freetype2'
	 'qt5-svg' 'hicolor-icon-theme' 'gawk' 'python-lxml')
optdepends=('transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript' 'cmake' 'subversion')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src")
sha256sums=('SKIP')
options=('!emptydirs' '!ccache')
provides=('texmacs')
conflicts=('texmacs')
LANG=C

pkgver() {
  cd ${_pkgname}
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  cd ${_pkgname}
  sed -e 's/-Wno-deprecated-register//' -i src/CMakeLists.txt # Remove wrong flag on Linux
}

build() {
  cd ${_pkgname}

  [[ -d build ]] || mkdir build
  cd build

  cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="$pkgdir" install

  # fix fig2ps script
  sed -i 's|${prefix}|/usr|' "$pkgdir"/usr/bin/fig2ps
  # fix FS#37518
  sed -i '/^Path=/d' "$pkgdir"/usr/share/applications/texmacs.desktop
}

# vim:set ts=2 sw=2 et:
