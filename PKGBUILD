# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
_repouser=neatbasis
_reponame=bandwidthd
_rev=0307fbba56a39a6e65ebadf488ad87979c64fdef
pkgver=2.0.2.r1.${_rev:0:10}
pkgrel=9
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url="https://github.com/neatbasis/bandwidthd"
license=(GPL)
depends=(sqlite libpcap libpng gd nginx)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${_repouser}/${_reponame}/archive/${_rev}.tar.gz
		01-bandwidthd-recover-cdf.patch
		02-bandwidthd-missing-comma.patch
		03-bandwidthd-subnet-reporting.patch
		04-bandwidthd-misc.patch
		05-bandwidthd-pidfile.patch
		bandwidthd.service
		bandwidthd-webui.service
		bandwidthd-webui.conf
		bandwidthd-rotate.timer
		bandwidthd-rotate.service
		bandwidthd.sysusers
		bandwidthd.tmpfiles)

sha256sums=('7e8ebf7e2eeb5266af904a8f7188b11d5a13ebb0343022c2a118b86f48a952e4'
            'b679dbd2fcc4ac8246c75cab0a5f0db86c00d2083c3b202e7fafb339114c971f'
            '641c006a8b90e9548a1b2ea3e40326a2128df69d490a13173e61469543b20352'
            '88c38a18b7bda6f3496dda3030ba118f8c461447dea426c13245099ae37a6d86'
            'be5fa230311258f14d4af6a00496443bfbc1a148a77f237bb4a0b663947e090a'
            'fc38a5623e66d82dec2efd28d2729e76e8f3b6056fb2bc2462a1ea1549f68807'
            '89c13a354ec9f9d913d82d21989bfbc90de6c15eff98697f7043142ae02f0fbf'
            '0290183d1e682eff11b88f4cc0ce5ee361db2a97a36300ab46a64c72fde9ae12'
            'cd7b1ffff5dd9490ab69d777e459d79c229d5fef2e71a811df29f6c11e6acde4'
            '31780d5d9c67158277a0edeeb672c594af97f96678222107db47ab4b2ede43b2'
            '7526f4baa5e2e66f87647f876a0b3a4c766ed7d7489ae801e85608338c85a782'
            'd734cea9710691a1658b9996e35cd407e85b542aa0961aec57fc49281516aa5d'
            '6c9e5bf89ecb580261a5a68ac240bd80ee43a7516c79023864acacbd8cee0ae2')

backup=('etc/bandwidthd/bandwidthd.conf'
		'etc/bandwidthd/bandwidthd-webui.conf')

prepare () {
	cd "${_reponame}-${_rev}"

	patch -Np1 -i ../01-bandwidthd-recover-cdf.patch
	patch -Np1 -i ../02-bandwidthd-missing-comma.patch
	patch -Np1 -i ../03-bandwidthd-subnet-reporting.patch
	patch -Np1 -i ../04-bandwidthd-misc.patch
	patch -Np1 -i ../05-bandwidthd-pidfile.patch

	sed -i 's|EXTRA_VERSION=".IPv6"|EXTRA_VERSION=".'${_rev:0:10}'"|' configure.in

	sed -i 's|output_cdf false|output_cdf true|' etc/bandwidthd.conf
	sed -i 's|recover_cdf false|recover_cdf true|' etc/bandwidthd.conf
	sed -i 's|graph false|graph true|' etc/bandwidthd.conf

	sed -i 's|#log_dir "/usr/local/var/bandwidthd"|log_dir "/var/lib/bandwidthd"|' etc/bandwidthd.conf
	sed -i 's|#htdocs_dir "/usr/local/var/bandwidthd/htdocs"|htdocs_dir "/var/lib/bandwidthd/htdocs"|' etc/bandwidthd.conf

	sed -i 's|pgsql_connect_string "dbname = bandwidthd password=kahlas12451 user = perkins host = localhost"|#pgsql_connect_string "dbname = bandwidthd password=kahlas12451 user = perkins host = localhost"|' etc/bandwidthd.conf
	sed -i 's|#sqlite_filename "/var/bandwidthd.db"|sqlite_filename "/var/lib/bandwidthd/bandwidthd.db"|' etc/bandwidthd.conf

	CFLAGS="-std=gnu89 -march=x86-64 -mtune=generic -O2 -pipe -fno-plt" ./configure \
		--prefix=/usr \
		--sysconfdir=/etc/bandwidthd \
		--localstatedir=/var/lib \
		--disable-python \
		--disable-pgsql \
		--without-x
}

build() {
	cd "${_reponame}-${_rev}"

	make -j1
}

package() {
	cd "${_reponame}-${_rev}"

	install -dm700 "${pkgdir}/var/lib/bandwidthd"

	make DESTDIR="${pkgdir}" install

	install -Dm644 "../bandwidthd.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "../bandwidthd-webui.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "../bandwidthd-webui.conf" -t "${pkgdir}/etc/bandwidthd"
	install -Dm644 "../bandwidthd-rotate.timer" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "../bandwidthd-rotate.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "../bandwidthd.sysusers" "${pkgdir}/usr/lib/sysusers.d/bandwidthd.conf"
	install -Dm644 "../bandwidthd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bandwidthd.conf"
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
