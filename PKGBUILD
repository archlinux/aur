# $Id$
# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=rtorrent-cdl
pkgnameorig=rtorrent
pkgver=0.9.6
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent with compact layout for download list'
url='http://rakshasa.github.io/rtorrent/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libtorrent=0.13.6' 'curl' 'xmlrpc-c' 'libsigc++')
conflicts=("$pkgnameorig")
provides=("$pkgnameorig")
source=("$pkgnameorig-$pkgver.tar.gz::https://github.com/rakshasa/${pkgnameorig}/archive/${pkgver}.tar.gz"
        "rtorrent-cdl.diff")
sha1sums=('27505081254618077c291eb1ee36bfb41f974834'
          '58bead603a95f99c791ebe99531142d3332af757')

build() {
	cd "${srcdir}/${pkgnameorig}-${pkgver}"

	patch -p1 -i "${srcdir}/rtorrent-cdl.diff"

	sed '/AM_PATH_CPPUNIT/d' -i configure.ac
	./autogen.sh

	export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
	./configure \
		--prefix=/usr \
		--disable-debug \
		--with-xmlrpc-c \

	make
}

package() {
	cd "${srcdir}/${pkgnameorig}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
}
