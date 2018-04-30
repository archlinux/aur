# Contributor: Gordon JC Pearce <gordon@gjcp.net>
# From the comment by Chuck Atkins <chuckatkins@gmail.com>
pkgname=ax25-tools
pkgver=0.0.10_rc4
_pkgver=${pkgver//_/-}
pkgrel=4
pkgdesc="The network tools to configure hamradio interfaces and some of the hamradio specific network daemons"
arch=('i686' 'x86_64')
url='http://www.linux-ax25.org'
license=('GPL2')
depends=('libax25')
makedepends=('make')
source=(
    "http://http.debian.net/debian/pool/main/a/${pkgname}/${pkgname}_${_pkgver}.orig.tar.gz"
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
sha1sums=('c98b7071302e7c9947cbab47c88bf1c1dd4132b0'
          'f3dfdfce9a795baef7f93d62d92441e81b96a83e')
sha256sums=('d36ad473f8261ea91dbef105d7493890774f2d1d03a485b86ddd23cbed597e20'
            '0b954ed9b717670e18b138030c8ed73af740357c50e1527e91d0ee3d12a12079')
