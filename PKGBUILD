# $Id$
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>
# Maintainer: Allen Li <cyberdupo56 at google mail>

_basename=conky
pkgname=conky-utfscroll
pkgver=1.9.0
pkgrel=1
pkgdesc='conky with UTF-8 scroll patch'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('docbook2x')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_basename}/${_basename}/${pkgver}/${_basename}-${pkgver}.tar.gz"
        "0001-Make-scroll-UTF-8-aware.-Fixes-bug-3134941.patch")
sha1sums=('a8d26d002370c9b877ae77ad3a3bbd2566b38e5d'
          'd3351960c39fb83009b280b449d7d14b505c9f8f')

provides=("${_basename}=${pkgver}")
conflicts=('conky')
replaces=('torsmo')

build() {
	cd "${srcdir}/${_basename}-${pkgver}"
    patch -p1 < ${srcdir}/0001-Make-scroll-UTF-8-aware.-Fixes-bug-3134941.patch

	CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-ibm \
		--enable-curl \
		--enable-rss \
		--enable-weather-xoap \
		--enable-imlib2 \
		--disable-lua \
		--enable-wlan \

	make
}

package() {
	cd "${srcdir}/${_basename}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
