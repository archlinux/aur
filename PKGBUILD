# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=23.7.3.14
pkgrel=1
provides=('clickhouse')
pkgdesc="ClickHouse is a fast open-source OLAP database management system"
arch=('x86_64')
url="https://clickhouse.tech/"
license=('Apache')
source=(
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-client-$pkgver-amd64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-common-static-$pkgver-amd64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-server-$pkgver-amd64.tgz"
	"clickhouse.sysusers"
	"clickhouse-server.service"
)
sha512sums=('f526a95a868aca470d8ff114c8717aa2abf0d794925963c5926696abc52b41674ebb5e50ee6b2be480e74763760a5e697e912710409b77dd5c329533f4bafd30'
            'f1a7a720393ec933d106eb81f604b8da52315f24b9c03203cb1183a6060ad579ecb064a7514d934d85695bb0daba8491d69f34eb2bce88a6194b18525c4e772b'
            '228091412cb8f66d7352f4473df5208a685b297294659c04f24bc5880468e992e442e1978b3147ad8820c1b05612a0783498114fe5e8f7de2a90c870c3f21e5c'
            '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
            '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')


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
