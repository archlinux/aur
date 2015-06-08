# Contributor: Gordon JC Pearce <gordon@gjcp.net>
# From the comment by Chuck Atkins <chuckatkins@gmail.com>
pkgname=ax25-tools
pkgver=0.0.10_rc4
_pkgver=${pkgver//_/-}
pkgrel=3
pkgdesc="The network tools to configure hamradio interfaces and some of the hamradio specific network daemons"
arch=('i686' 'x86_64')
url='http://www.linux-ax25.org'
license=('GPL2')
depends=('libax25')
makedepends=('make')
source=("http://www.linux-ax25.org/pub/${pkgname}/${pkgname}-${_pkgver}.tar.xz" "ax25.patch")
sha1sums=('c0c16ae86e8f41abb65e4467b619ba06ea310aa0'
          'f3dfdfce9a795baef7f93d62d92441e81b96a83e')

build() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	# comment out the line below to leave off the PID file generation
	patch -Np0 -i "${srcdir}/ax25.patch" || return 1
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin || return 1
	#make clean
	make || return 1
}

package() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	# pre-create the directories because the makefile is crap
	mkdir -p ${pkgdir}/usr/bin
	make install DESTDIR=$pkgdir || return 1
	make installconf DESTDIR=$pkgdir || return 1
}
