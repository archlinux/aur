# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=25.3.1.2703
pkgrel=1
provides=('clickhouse')
pkgdesc="ClickHouse is a fast open-source OLAP database management system"
arch=('x86_64' 'aarch64')
url="https://clickhouse.tech/"
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
sha512sums_x86_64=('03885c37bb08811227d5fd74b380a2b21d6243896199d829cfdc2d88fb9b6290e2a90adf5494541dee356746b180754a5a4b72e8631ead34300e7a840ed81cfc'
                   '85698aead2411aacbe0f2de7949a5f7317bf6fa3c32bc955d2859f91f04800a7b1935bd6585e3a4c585a2c00c0bf6c78812782c73eba22ca2d0e9cea6edb9e12'
                   '091a2c11219e243d28f561abc0013056ae5c00a8be6400ec5ed4f647791f06386e4933edbcde5bb2f26f349d75f38dd3a033214ee5ad4329166edbfdf65b4490'
                   '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
                   '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')
sha512sums_aarch64=('ddf7bc822ed6e42d4fbedc2babad5d8e2e46f0b30d758e131e9aa210c3f303497dd4d0aa7353614b8b1c5704f3b0e5a459a0898fe2c1096e3232f0035a2b4182'
                    'ea4b51f7fd22670069eb26fa905bbd89da782106ab148dcd7a3e0cba2f838692ebff7c506c637bd5bf2308adaf0dab98cd2a758a75e008b5e39d57d113edf7fa'
                    '11f90ffc44484385bcac225308e33c66714109e18c945d5bba9325b1712e3b5195ce8cc5e020e13489373ae672c9dda20cc75f68456e9a2943e85073ae0e00e4'
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
