# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=26.5.1.882
pkgrel=1
provides=('clickhouse')
pkgdesc="ClickHouse is a fast open-source OLAP database management system"
arch=('x86_64' 'aarch64')
url="https://clickhouse.com/"
license=('Apache-2.0')
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
sha512sums_x86_64=('7ec0897463dfa8b9b6e6d0811fae2d173badda6ce60859506e4bb3bf50b1cfdb27bee6f55de1d5a5f71ceb86f84358908e52cc5bdffaf9a16e14437ed969b34a'
                   'bfc269bc2de95fb9594846f30ac16c376bd286cc03fb71db340fba71b4c568f49e702717f85d54eabc82dc4ae5104976884552a48eb6eee7b433087ea26935f0'
                   'f3aa2cb817760d6edfac3ea252bdd5975c73cfd14b7b0122de126dd0f071dc72f1fee4ce4ab6bc0445cd2c71c43e1e13493eb560e72ebc18f99f94346446ea71'
                   '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
                   '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')
sha512sums_aarch64=('a8c0e77343d038593406a5a5476afd7d090a778384b43eee38ee67e2d493fd4bdc527406766c4485a8de0af73f3bf58b164c04a1a0eddf85d7bed7f554f4818e'
                    'a7b3a2e4e0ca777e3b52ce1a3bb96b581a4ee9547d5f7336ecb91362174272f8100c2649140b6f169afbba695f5d5234e76988f21faac1d9f9cd92fa3b18e52e'
                    'd46c7b436c886e6067a17df540f175e4fd6775e10b540ad90869279ed2b81f3fe3b6074e44054e9591ecc795d267f1e4e2b21f101eebe22c1b21562d59f9f82e'
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
