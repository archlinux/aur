# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Stewart Starbuck <stewart@stewartstarbuck.co.uk>

pkgname=sthttpd
pkgver=2.27.1
pkgrel=4
pkgdesc='Supported fork of the thttpd web server'
url='https://github.com/blueness/sthttpd'
license=('custom:BSD')
arch=('x86_64')
depends=('libxcrypt')
backup=('etc/thttpd.conf')
validpgpkeys=('1FEDFAD9D82C52A53BABDC799384FA6EF52D4BBA')
source=("$pkgname-$pkgver.tgz::https://github.com/blueness/sthttpd/archive/v2.27.1.tar.gz"
        'discreet.patch'
        'service'
        'config')
sha256sums=('a1ee2806432eaf5b5dd267a0523701f9f1fa00fefd499d5bec42165a41e05846'
            'be953777f2b5b860f1c5a8c96d8478535fe517d76bd4b76597d743a96c2659cf'
            '6fea42a6876e2a44eff4f76ed64befabe400e5c844b11b782b1507299e5eb986'
            '1f42c7625422944bd035731d264a711f50b47f4e4f58b6c67693f09fabb76350')

conflicts=('thttpd')
provides=('thttpd')
replaces=('thttpd')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../discreet.patch
	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export WEBDIR=/srv/http
	export WEBGROUP=root
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -fr "${pkgdir}"/srv

	install -Dm644 ../config "${pkgdir}"/etc/thttpd.conf
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/thttpd.service
	install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Avoid conflicts with Apache
	mv "${pkgdir}"/usr/bin/htpasswd{,-thttpd}
	mv "${pkgdir}"/usr/share/man/man1/htpasswd{,-thttpd}.1
}
