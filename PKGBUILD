# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abiword-svn
pkgver=35440
pkgrel=1
pkgdesc='Fully-featured word processor from subversion sources'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.abisource.com'
depends=('fribidi' 'wv' 'goffice' 'redland' 'libical' 'loudmouth' 
	 'enchant' 'lasem' 'libwpg' 'libwmf' 'link-grammar' 'gtkmathview' 'aiksaurus'
	 'libots' 'libchamplain' 'psiconv' 'telepathy-glib' 'libwps')
makedepends=('asio' 'boost' 'gobject-introspection' 'python2' 'libwpd' 'subversion')
conflicts=('abiword' 'abiword-plugins')
replaces=('abiword' 'abiword-plugins')
options=('!makeflags')
source=(abiword::svn+http://svn.abisource.com/abiword/trunk \
	    aiksaurus-plugin.m4 plugin-builtin.m4 plugin-configure.m4 \
	    plugin-makefiles.m4 gcc7.diff)
sha256sums=('SKIP'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            'c2d5851f66755c8b3bae8d16988f6f85a943ca76341c735b898a3635568de10f'
            '784508cdf5aa426258bc82c05fe79a3bbb7a0738b243b6a55a8fef58314439a6'
            '99428d00304404e086c81ac9c2c9c68b9c5e532abae87c7b29b4bda22d85db4d'
            '4654f1a468dbc3f9a7339ca8b4a62f59ba394bd04a077ab5dc5ef86dacbe76f8')
_svnmod=abiword

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd ${pkgname%-svn}
  # Install missing m4 files
  install -m644 ../aiksaurus-plugin.m4 plugins/aiksaurus/plugin.m4
  install -m644 ../plugin-builtin.m4 .
  install -m644 ../plugin-configure.m4 .
  install -m644 ../plugin-makefiles.m4 .
  
  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-list.m4
  patch -p0 < "$srcdir"/gcc7.diff || true
}

build() {
  cd ${pkgname%-svn}
LANG=C
  export CXXFLAGS+=" -O3"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
	      --enable-shared \
	      --disable-static \
	      --enable-clipart \
	      --enable-templates \
	      --enable-plugins="hrtext google bmp xslfo command pdf \
                          passepartout eml wordperfect psion aiksaurus s5 \
                          sdw opml garble grammar latex epub wikipedia gimp \
                          opendocument paint mswrite wmf mif freetranslation \
                          ots wpg kword gdict collab iscii goffice pdb \
                          openwriter t602 presentation mathview \
                          openxml wml mht applix loadbindings urldict \
                          clarisworks docbook hancom babelfish" \
	      --enable-introspection 
  make
}

package() {
  cd ${pkgname%-svn}
  make DESTDIR="$pkgdir" install
}
