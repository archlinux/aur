# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>

_pkgbase='libgdiplus'
pkgname="lib32-${_pkgbase}"
pkgver='2.10.9'
pkgrel=2
pkgdesc="An Open Source Implementation of the GDI+ API (32 bit)"
arch=('x86_64')
license=('MPL' 'LGPL')
url="http://www.mono-project.com"
depends=('lib32-libtiff' 'lib32-cairo' 'lib32-libexif' 'lib32-giflib' 'lib32-glib2' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://download.mono-project.com/sources/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2"
	'libpng15.patch'
	'libgdiplus0-giflib5.patch'
	'libgdiplus-2.10.9-gold.patch'
	'libgdiplus-freetype-2.5.1.patch')
sha256sums=('6ddeb6c327bada7cb6e06d1a20714f526a0c69520dfd42c12ddd032c3c5d964e'
	'ae18bac02341af98ed17b14ee510c33cc87d0637a9cf56fedaf21603aa04198c'
	'd84a83fdfdda3a62e488c7466c550bf231ba01d83b465871f23381d548c20602'
	'e437641ab6d7d21afd3234b7d49b10ceb7e80c33e6a22e85d1a9679f5a2bdf9c'
	'df0ee598d657e373b75989ca7e1d2084986e7f30605d21f80064bec0b8b5c25f')

prepare() {
	cd "${_pkgbase}-${pkgver}"
	patch -Np0 -i ../libpng15.patch
	patch -Np1 -i ../libgdiplus0-giflib5.patch
	patch -Np1 -i ../libgdiplus-2.10.9-gold.patch
	patch -Np0 -i ../libgdiplus-freetype-2.5.1.patch

	sed -i -e 's/-L\${libjpeg_prefix}\/lib -ljpeg/-ljpeg/' configure
}

build() {
	cd "${_pkgbase}-${pkgver}"
	./configure --prefix=/usr --with-cairo=system \
				--libdir=/usr/lib32 CC='gcc -m32'
	make
}

package() {
	cd "${_pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}