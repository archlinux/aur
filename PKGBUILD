# Maintainer: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >

pkgname=xf86-input-synaptics-git
pkgver=1.8.0.r25.gfc9f490
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/wiki/"
license=('custom')
depends=('libxi>=1.2.1' 'libxtst')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=('!libtool' 'zipman')
source=('50-synaptics.conf.patch'
        "$pkgname::git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics")
sha512sums=('a99c0f652d810a39297180e6a5e860ddf48fa9cc27dbc21a05255d53091d4f0d8dfe4fbae6cb55023370a0def1e7cb980703139745a511ea4c8e6a1d518fbdba'
            'SKIP')

pkgver() {
	cd "$pkgname"
	# cutting off 'xf86.input.synaptics.' prefix
	git describe --long | sed 's/^xf86.input.synaptics.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
	make
	patch conf/50-synaptics.conf < $srcdir/50-synaptics.conf.patch
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="${pkgdir}" install
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
} 

