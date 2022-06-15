# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abiword-git
pkgver=3.1.0.20713.7f124ca95
pkgrel=2
epoch=1
pkgdesc="Fully-featured word processor from official gnome gitlab mirror"
arch=('i686' 'x86_64')
url="http://www.abisource.com"
license=('GPL')
depends=('wv' 'goffice' 'redland' 'libical' 'loudmouth' 'enchant' 'libwpg'
	 'libwmf' 'aiksaurus' 'libots' 'libchamplain' 'psiconv' 'libwps'
	 'telepathy-glib')
makedepends=('git' 'asio' 'boost' 'gobject-introspection' 'libwpd' 'autoconf-archive')
provides=('abiword' 'abiword-plugins')
conflicts=('abiword' 'abiword-plugins')
source=("git+https://gitlab.gnome.org/World/AbiWord.git"
	'aiksaurus-plugin.m4' 
	'command-plugin.m4' null.patch)
sha256sums=('SKIP'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            '2f26826e9d59d80dacd0dae4aceb815804eaa75954e47507a0897794f33e45be'
            'e1527f5300e177549c64311d84ef76d0a63275b83ee7150213b38a63b5065063')

pkgver() {
  cd AbiWord
  major=$(awk '/\[abi_version_major\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  minor=$(awk '/\[abi_version_minor\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  micro=$(awk '/\[abi_version_micro\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  printf "%s.%s.%s.%s.%s"  $major $minor $micro $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd AbiWord
  # Install missing m4 files
  install -m644 ../aiksaurus-plugin.m4 plugins/aiksaurus/plugin.m4
  install -m644 ../command-plugin.m4 .
  
  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-list.m4
  git apply "$srcdir"/null.patch 
}

build() {
  cd AbiWord
  export CXXFLAGS+=" -O3 -Wno-deprecated-declarations"

  LANG=C LC_CTYPE=C ./autogen.sh --prefix=/usr \
      --enable-shared \
      --disable-static \
      --enable-clipart \
      --enable-templates \
      --enable-plugins="hrtext google bmp xslfo command pdf \
                        passepartout eml wordperfect psion aiksaurus s5 \
                        sdw opml garble latex epub wikipedia gimp \
                        opendocument paint mswrite wmf mif freetranslation \
                        ots wpg kword gdict collab iscii goffice pdb \
                        openwriter t602 presentation mathview \
                        openxml wml mht applix loadbindings urldict \
                        clarisworks docbook hancom babelfish" \
      --enable-introspection
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd AbiWord
  make DESTDIR="$pkgdir/" install
}
