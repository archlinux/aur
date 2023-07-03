# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=23.6.1.1524
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
sha512sums=('e3e89a996a91372e8be135fa1cbb470e7c98206fed4fac28379cb58d560f14c1c14ff3e725c92a3549190bab560911ae083f645dee015d32d8758c76c0ada63d'
            'd59901bcc0567917f2febd337bab524d9f31828c5506934ba97632af70dd958e032c29582e5871d57608559a152cc2a7641e3cd9964300d99a78307a7fd09b30'
            '9dcc48d27b4b75a33162fc35cb9d4255775d99219da5fd3e391c576a37b682018810fc1d1b47b4af049390c9acd07a17532a1cdeb1dfe2f411642dec172f7483'
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
