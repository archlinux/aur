# Contributor: Gordon JC Pearce <gordon@gjcp.net>
# From the comment by Chuck Atkins <chuckatkins@gmail.com>
pkgname=ax25-tools
pkgver=0.0.10_rc5
_pkgver=${pkgver//_/-}
pkgrel=4
pkgdesc="The network tools to configure hamradio interfaces and some of the hamradio specific network daemons"
arch=('i686' 'x86_64')
url='http://www.linux-ax25.org'
license=('GPL2')
depends=('libax25')
makedepends=('make')
source=(
    "https://ham.packet-radio.net/packet/ax25/${pkgname}/${pkgname}-${_pkgver}.tar.gz"
    'ax25.patch'
)
backup=('etc/ax25/ax25.profile'
        'etc/ax25/ax25d.conf'
        'etc/ax25/axspawn.conf'
        'etc/ax25/nrbroadcast'
        'etc/ax25/rip98d.conf'
        'etc/ax25/rxecho.conf'
        'etc/ax25/ttylinkd.conf')

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

md5sums=('b8cf1495820c445013c3776babcd057d'
         '6b51a5b1f58e7238fa223e8e439ae8bc')
