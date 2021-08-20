# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgbase='clickhouse-bin'
pkgname=('clickhouse-server-bin' 'clickhouse-common-static-bin' 'clickhouse-client-bin')
# 'stable' - for production environment
# 'testing' - most recent version
# 'prestable' and 'lts' are available
_channel='stable'
pkgver=21.8.4.51
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
sha512sums=('6333297d9ce5665bd910535ea12a41e4e133ff8e671c8dd8ff6d2aded15fa4d36f2943fd793b25a266847ff11453005a947e41dfd1b4bf1f7b5bcaba2f66b287'
            '6cc9ba8ea1edaf31138d9f28a0109191dc162c07fb1a4e99008d597ad72b8063a0c77827c409a9e7b08348f02705c3384da5ef4a2625e1a078999b7c392ef257'
            '2db6f80c6b93f600c4e02fa5fbf2612d273077cafdd2f33d02f00b94a7ab6277a200fb7fcf4085add8bc2f29490b0bd11227cb7389a541346b6e87e91d7d5b6e'
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
