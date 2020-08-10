# Maintainer: Spider.007 <aur@spider007.net>
pkgname=graylog
pkgver=3.3.4
pkgrel=1
pkgdesc="Graylog is an open source syslog implementation that stores your logs in ElasticSearch and MongoDB"
arch=('any')
url="https://www.graylog.org/"
license=(GPL)
depends=('java-runtime-headless=8')
optdepends=('elasticsearch' mongodb)
install=graylog.install
changelog=UPGRADING.rst
backup=(
	etc/graylog/server/server.conf
)
source=(
	https://packages.graylog2.org/releases/$pkgname/$pkgname-${pkgver/_/-}.tgz
	graylog-tmpfiles.conf
	graylog.service
)

sha256sums=('fa59c73cb65006e68e292867ff29838591844b978650f96f3090d16bcab2d673'
            'SKIP'
            'SKIP')

prepare() {
	curl -O https://raw.githubusercontent.com/Graylog2/graylog2-server/3.2/UPGRADING.rst
}

package() {
	cd "$pkgdir"

	install -d var/lib/graylog/spool
	install -d var/lib/graylog/data/journal
	chown nobody: -R var/lib/graylog/

	for f in sigar.jar libsigar-{amd64,x86}-linux.so; do
		install -Dm 644 "$srcdir/$pkgname-${pkgver/_/-}/lib/sigar/$f" usr/lib/graylog/lib/sigar/${f##*/}
	done

	for p in "$srcdir/$pkgname-${pkgver/_/-}"/plugin/*; do
		install -Dm644 $p usr/lib/graylog/plugin/${p##*/}
	done
	install -Dm644 "$srcdir/$pkgname-${pkgver/_/-}"/graylog.jar usr/lib/graylog/server.jar
	install -Dm644 "$srcdir/graylog-tmpfiles.conf" usr/lib/tmpfiles.d/graylog-server.conf
	install -Dm644 "$srcdir/graylog.service" usr/lib/systemd/system/graylog.service

	for f in README.markdown COPYING; do
		install -Dm644 "$srcdir/$pkgname-${pkgver/_/-}/$f" usr/share/doc/$pkgname/${f##*/}
	done

	install -Dm644 "$srcdir/$pkgname-${pkgver/_/-}"/graylog.conf.example $pkgdir/etc/graylog/server/server.conf

	# make absolute just in case
	sed -i 's~^\(plugin_dir =\) plugin$~\1 /usr/lib/graylog/plugin~g' $pkgdir/etc/graylog/server/server.conf
	sed -i 's~^\(message_journal_dir =\) data/journal$~\1 = /var/lib/graylog/data/journal~g' $pkgdir/etc/graylog/server/server.conf
	sed -i 's~^\(content_packs_dir =\) data/contentpacks$~\1 = /usr/lib/graylog/data/contentpacks~g' $pkgdir/etc/graylog/server/server.conf
}
