# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch> # Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20220528.13877
pkgrel=2
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python' 'libxext' 'freetype2'
	 'qt5-svg' 'hicolor-icon-theme' 'gawk')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript' 'cmake')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src"
        )
sha1sums=('SKIP')
options=('!emptydirs' '!ccache')
provides=('texmacs')
conflicts=('texmacs')

pkgver() {
  cd ${_pkgname}
  LANG=en svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  rm -rf ${_pkgname}-build
  svn export ${_pkgname} ${_pkgname}-build

  cd ${_pkgname}-build
  sed -e 's/-Wno-deprecated-register//' -i src/CMakeLists.txt # Remove wrong flag on Linux
}

build() {
  cd ${_pkgname}-build

  mkdir -p build
  cd build

  cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8
  make
}

package() {
  cd ${_pkgname}-build/build
  make DESTDIR=${pkgdir} install

  # fix fig2ps script
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  # fix FS#37518
  sed -i '/^Path=/d' "${pkgdir}/usr/share/applications/texmacs.desktop"
}

# vim:set ts=2 sw=2 et:
