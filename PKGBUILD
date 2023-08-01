# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

_pkgname=autotrace
_date='20200219'
_revision='65'
_pkgver="0.40.0-$_date"
pkgname="${_pkgname}-bin"
pkgver="${_pkgver/-/_}"
pkgrel=3
pkgdesc='AutoTrace is a utility for converting bitmap into vector graphics.'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'libmagick6' 'glib2')
makedepends=('pkgconf' 'patchelf')
source=("https://github.com/autotrace/autotrace/releases/download/travis-$_date.$_revision/${_pkgname}_${_pkgver}_all.deb")
sha256sums=('14afaed3d872f19879f3805dbb52a4721206828542068fb035e962ee2b65aedc')

package() {
	msg2 'extract compiled binary...'
	tar -xf data.tar.xz -C ${pkgdir}

	msg2 'patching binary...'
	PKG_CONFIG_PATH="$(pkg-config --variabl pc_path pkg-config)"
	PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig:${PKG_CONFIG_PATH}"
	export PKG_CONFIG_PATH
	LIB_NAME="$(pkg-config --variable libname MagickCore)"

	# patch the binary
	# libMagickCore-6.Q16.so.2 is the name of the imagemagick library bundled with autotrace
	patchelf --replace-needed libMagickCore-6.Q16.so.2 "lib${LIB_NAME}.so" ${pkgdir}/usr/bin/autotrace
	# libpng12.so.0 is not needed because libpng16.so.0 is also included
	patchelf --remove-needed libpng12.so.0 ${pkgdir}/usr/bin/autotrace
}
