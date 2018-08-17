# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abiword-svn
pkgver=35477
pkgrel=2
pkgdesc='Fully-featured word processor from subversion sources'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.abisource.com'
depends=('fribidi' 'wv' 'goffice' 'redland' 'libical' 'loudmouth' 
	 'enchant1.6' 'lasem' 'libwpg' 'libwmf' 'gtkmathview' 'aiksaurus'
	 'libots' 'libchamplain' 'psiconv' 'telepathy-glib' 'libwps')
makedepends=('asio' 'boost' 'gobject-introspection' 'python2' 'libwpd' 'subversion')
conflicts=('abiword' 'abiword-plugins')
replaces=('abiword' 'abiword-plugins')
options=('!makeflags')
source=("abiword::svn+http://svn.abisource.com/abiword/trunk#revision=35477"
	'enchant-2.1.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/enchant-2.1.patch?h=packages/abiword'
	'aiksaurus-plugin.m4::https://git.archlinux.org/svntogit/packages.git/plain/trunk/aiksaurus-plugin.m4?h=packages/abiword' 
	'command-plugin.m4::https://git.archlinux.org/svntogit/packages.git/plain/trunk/command-plugin.m4?h=packages/abiword' in_chroot.patch)
sha256sums=('SKIP'
            '444dc2aadea3c80310a509b690097541573f6d2652c573d04da66a0f385fcfb2'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            '2f26826e9d59d80dacd0dae4aceb815804eaa75954e47507a0897794f33e45be'
            '379908e0a2d9fd58fe7529283378079c79da6a519d99dc59a2e774f2f045a8e4')
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
  install -m644 ../command-plugin.m4 .
  
  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-list.m4
  patch -Np1 < "$srcdir"/enchant-2.1.patch || true
  patch -Np0 < "$srcdir"/in_chroot.patch || true
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
                          sdw opml garble latex epub wikipedia gimp \
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
