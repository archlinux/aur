# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=24.4.1.2088
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
sha512sums_x86_64=('d6a23351c2978d22b7bb4880b3428f310ffa37cdad400382fd52bef4c02783b0a800e3f9a2eae0a8c101beedc52db5263441ed36b3cce1dbf4ea5a5c6d355ad1'
                   '74a6986d4eff72f2d10048a0ca8d9c0463c79bd41fc7e7b96f1cbf99e71a80511012ff30504d4a30387533e180cf9ee94d80858aa54e39635ecd0338276cce96'
                   'd7331f8beb762ccae364ec2207c8018e4599267817dbd64b91631407cbe750f3b8f3605cf6db05c2a7360f233ba3cfd77de56f2621d3a6f0f4c18a61d6404ea6'
                   '70af4456ded1a1bb5cf29d2d3b29086aedc7875ef673e8817f389243f0c79eb491c9ce715b94542cbe16eb7489d97411ff0ab4a1a7f6c9b9120c659b87ea25b7'
                   '6b22c7e27961c1453f8ce71457085cb24271ed1962033f78ea2483560bb6ad265a117414c5a9627a1733429d4080adf1fea4490073a7e522a002753d4d87d01c')
sha512sums_aarch64=('78f78a2746836e8b7f86e0f8a5242dd73260765727ec7fb1216ef55595af8bd89f9a09bf729e74b0bf925f66df9f9f8f879e1313dfbdcfb889a9a1563ef15f94'
                    '83db4d854b6eae7f92c98fc3df19950a69ef4d6f1f6df58c67248786eadad5a9a2d02915793ba6b85cc6d8a0a4227b19cf300586334c28bf38136ab0aa3104f5'
                    'd38922f7ee0c8c0a2753305a684fcb92ea802fd782bdf39ba78c386649d891ab628774407a529d32e3d40d2257fe677bf7be7e5a052d32486de1dc151b7cf849'
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
