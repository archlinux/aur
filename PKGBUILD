# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=20.12.5.14
pkgrel=1
provides=('clickhouse')
pkgdesc="ClickHouse is a fast open-source OLAP database management system"
arch=('x86_64')
url="https://clickhouse.tech/"
license=('Apache')
source=(
	"https://repo.yandex.ru/clickhouse/tgz/$_channel/clickhouse-client-$pkgver.tgz"
	"https://repo.yandex.ru/clickhouse/tgz/$_channel/clickhouse-common-static-$pkgver.tgz"
	"https://repo.yandex.ru/clickhouse/tgz/$_channel/clickhouse-server-$pkgver.tgz"
	"clickhouse.sysusers"
	"clickhouse-server.service"
)
sha512sums=('6196148e9e49296cbc2ed774e5c0733892476a23acbfc92d50ec4ac70065d9758cc709e6ffc7cd436d3251b0823226a3f92a8ada64b618ac848fd6c5a4f8dadf'
            '78f0b1fe919bedfb528c02cf149ea2b3853c26687bdc333efb45f61647e47b1c9b33789afaa2d1539343934dae06a0534044267aa03c908000a0b74767ff2c65'
            '9dea27481f4fe8507a39f19d006866c295b72472b345a6d1cf3d3a00eeb674d95742dc09efcea1c4dd88bca9435e6c51bf3eadaefb9a795e950f4bf5c4d9aae6'
            '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
            'f70fb1fc8d26e1d6c8b4f5c808b373d464cd20ace363cfd735703d1af0f6ec6196a0c7c905d804fad789eb51acab4896397e70b64a0b61cdcd7457a6694fc4b3')


package_clickhouse-client-bin() {
	depends=('clickhouse-common-static-bin')
	backup=('etc/clickhouse-client/config.xml')
	pkgdesc="ClickHouse client and other client-related tools."

	cd "clickhouse-client-$pkgver"
	cp -a etc usr $pkgdir
}

package_clickhouse-common-static-bin() {
	# options and directives overrides
	pkgdesc="ClickHouse compiled binary files."
	backup=('etc/security/limits.d/clickhouse.conf')

	cd "clickhouse-common-static-$pkgver"
	cp -a etc usr $pkgdir
}

package_clickhouse-server-bin() {
	# options and directives overrides
	pkgdesc="ClickHouse server and default configuration."
	depends=('clickhouse-common-static-bin')
	backup=(
		'etc/clickhouse-server/config.xml'
		'etc/clickhouse-server/users.xml'
	)

	cd "clickhouse-server-$pkgver"
	cp -a usr "$pkgdir/"
	cp -a lib "$pkgdir/usr"
	mkdir -p "$pkgdir/etc/clickhouse-server"
	cp -a etc/clickhouse-server "$pkgdir/etc"
	install -D "$srcdir/clickhouse.sysusers" "${pkgdir}/usr/lib/sysusers.d/clickhouse.conf"
	install -D "$srcdir/clickhouse-server.service" "${pkgdir}/usr/lib/systemd/system/clickhouse-server.service"
}
