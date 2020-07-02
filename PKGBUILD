# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=20.4.6.53
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
sha512sums=('1e2a2fff79afb3376830783062d4262d6e6dfa6077fdac1e9cf837e87a9a34640a3d65e64ebec9b43e60a8c918ef0244b226e560001781a3a01d679217d05783'
            'b3d62202acaa9b3ea6d4c046a3865f797d9542165ebbfeac89b8c323fc34a047ad678f2898829d5a69fbadc0bbd8125874780b780458a1f4af3918f2dc2e9dbc'
            '306e1e35de8e03873c234a117b5ff03840f26c6300aabd156437472ff211752de319a256a30868b232c7b708c2927e1c82a7da982dae7a3507c52a99a3e7620e'
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
