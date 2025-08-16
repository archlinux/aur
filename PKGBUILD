# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=25.7.4.11
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
sha512sums_x86_64=('8c4a8f3fc4e89118e1744c311bc8ef2c7ea8fccdc49edc0a41d9f94646525e39882e323151a43c0f1c9f8cfadae2fe963ec1612a9d6063b61961ec9e42e7d2d8'
                   'ade82a34bb228164c17c72c5ea9450f342aaf2f7fc365a61b7166337cfa96c21cea3e0f53b4c7593270f0b87be6dc4647cf0262b6a19ef48c47ab226f66a16f4'
                   '2d5e74d4b45e69c983f2cf2976354356f27397384545697d1dbff216703389f8efeffa40e82639c66eb5e4a303dccaa189dcfde834a1122f0dde69921f8cbdf3'
                   '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
                   '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')
sha512sums_aarch64=('4f6f432bed71eda82647956e9bad8141374b8052fa180a1cc3cc3c61443080ea4827e82492af1479dbaa0d678051e0a83ada9e6f81bfcad406c48bf89240dfac'
                    '356ebeb7b348ff6f0caacfd6daad0503a8602116d9f15c70ba5d639307be93bf88791602f911e6656e5b88968aaff6774c6c05cf71ca65fdeebcfe6fd5a3f485'
                    '0b29b5ab487e60cf5554ec947dbf2e26d12e5b3a403c1777782ff070af532506596fc7ec0bbc47f2d170f39f4be81c75c9cda6b243d093b8a4fb3f9d6d36484d'
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
