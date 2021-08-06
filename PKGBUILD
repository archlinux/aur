# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=21.7.6.39
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
sha512sums=('cdb1ca40ff0d1969401de8b2df6de7e46d03e7a1520084e24e3d14bcc9e2063848ecad3fd9ad2df81ab53886849100b205fc8b5b75ab89d4f6fa44d5859efcd8'
            '0555aa5fe39b3cd02505624133a382c63e42473ac2ffebcec26d6c52886252a48c97b60ff36129f5e54b1834c9bd66ab2d158de6f17ecb80e0cec7b676c9398b'
            '3cc944e8a6827e1d8131a8edce39918f75117b2a0bcea8f26e69ed23c780fb8bd2d0c55d7ee608354fb573aefa2e3cf468ca51f633f2054c8c500be09c53c5f3'
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

	cd "clickhouse-common-static-$pkgver"
	cp -a usr $pkgdir
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
