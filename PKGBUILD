# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abiword-svn
pkgver=35434
pkgrel=1
pkgdesc='Fully-featured word processor from subversion sources'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.abisource.com'
depends=('fribidi' 'wv' 'goffice' 'redland' 'libical' 'loudmouth' 
	 'enchant' 'lasem' 'libwpg' 'libwmf' 'link-grammar' 'gtkmathview' 'aiksaurus'
	 'libots' 'libchamplain' 'psiconv' 'telepathy-glib')
makedepends=('asio' 'boost' 'gobject-introspection' 'python2' 'libwpd' 'subversion')
conflicts=('abiword' 'abiword-plugins')
replaces=('abiword' 'abiword-plugins')
options=('!makeflags')
source=(abiword::svn+http://svn.abisource.com/abiword/trunk \
	aiksaurus-plugin.m4 plugin-builtin.m4 plugin-configure.m4 plugin-makefiles.m4)
sha256sums=('SKIP'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            '98c5d8b0b7c37a2a88fc57af4a5c654384dad85fc78929bc679f28d79f692568'
            '784508cdf5aa426258bc82c05fe79a3bbb7a0738b243b6a55a8fef58314439a6'
            '71b17f53e9e9c7e805b6b1f5a1e15f891f319b1b2c788f7d4cc42706d338286d')
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
}

build() {
  cd ${pkgname%-svn}
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
