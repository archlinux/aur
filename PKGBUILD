# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Jan Tojnar <jtojnar@gmail.com>

_pkgname=abiword
pkgname=abiword-patronus
pkgver=20417
pkgrel=1
pkgdesc='Fully-featured word processor built with Patronus grammar checker'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.abisource.com'
depends=('fribidi' 'wv' 'goffice' 'redland' 'libical' 'loudmouth'
   'enchant' 'lasem' 'libwpg' 'libwmf' 'patronus' 'gtkmathview' 'aiksaurus'
   'libots' 'libchamplain' 'psiconv' 'telepathy-glib')
makedepends=('asio' 'boost' 'gobject-introspection' 'python2' 'libwpd' 'subversion')
conflicts=('abiword' 'abiword-plugins')
replaces=('abiword' 'abiword-plugins')
options=('!makeflags')
source=(${_pkgname}::git+https://github.com/patronus-checker/abiword \
  aiksaurus-plugin.m4 plugin-builtin.m4 plugin-configure.m4 plugin-makefiles.m4)
sha256sums=('SKIP'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            'c2d5851f66755c8b3bae8d16988f6f85a943ca76341c735b898a3635568de10f'
            '5a9fa885e09a9ac982b5f29edc2bd9089f618c9ce1304ea9edd3d740b7ae3d92'
            'b898dc9a1afed21701d8151ab3749c2d95b5f2cc01898136bde2d12a5e17424e')

pkgver() {
  cd "${_pkgname}"
  git rev-list --count HEAD
}

prepare() {
  cd ${_pkgname}
  # Install missing m4 files
  install -m644 ../aiksaurus-plugin.m4 plugins/aiksaurus/plugin.m4
  install -m644 ../plugin-builtin.m4 .
  install -m644 ../plugin-configure.m4 .
  install -m644 ../plugin-makefiles.m4 .

  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-list.m4
}

build() {
  cd ${_pkgname}
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
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
}
