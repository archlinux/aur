# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=24.3.2.23
pkgrel=1
provides=('clickhouse')
pkgdesc="ClickHouse is a fast open-source OLAP database management system"
arch=('x86_64' 'aarch64')
url="https://clickhouse.tech/"
license=('Apache')
source_x86_64=(
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-client-$pkgver-amd64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-common-static-$pkgver-amd64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-server-$pkgver-amd64.tgz"
	"clickhouse.sysusers"
	"clickhouse-server.service"
)
source_aarch64=(
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-client-$pkgver-arm64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-common-static-$pkgver-arm64.tgz"
	"https://packages.clickhouse.com/tgz/$_channel/clickhouse-server-$pkgver-arm64.tgz"
	"clickhouse.sysusers"
	"clickhouse-server.service"
)
sha512sums_x86_64=('0606c0bdf0d1cbfce32284742c8bb5f3d3a0afe7cb7a0c4b12d44dda3aa8d904d531cb05e6ce49d823ceb78f33949e92cef0d9969d7c17c37c5317f21787747f'
                   'b1a50cb647e6f6a2271b21c6f07e793934bf7e63c79bd0737dc6a602a82a08559c341a362d3958d8ec36db66424223f61be341b8b6064881f9f6d9cfa0f3abee'
                   '8e25fd7ab8e7d4c4cfa8bb3601fb32d551401dfa417ad172c1e82a901aeeb233ad1aee8b4f77aea8868444862af7f59a145b01e3610c81367addf319f2ff1d87'
                   '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
                   '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')
sha512sums_aarch64=('ee5c4e039d147df9212a5e2c0a94a9be8819d64a3be82706e0a8322001825d47a3caf584ce904308eb056d2a0aedb38282ef559676f6c56a06a00f9211405cde'
                    '31e93419a626e9ffcdff8b469d7c5e3c672c8178739d75c44cc9c3115601d21111c64de80b5eb4fe3ed5b2af36bc719d07c5124fb0d2d9b1f15a432576a3876d'
                    'a34482b0c3905901f559b65fccf3430331f6ebc6e045b98c52084a00d93e16f49531c9a32ab948d9e40133ab0c0bc4407d5e570abe1023c2358e281d78b20fa3'
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
