# Maintainer: Spider.007 <aur@spider007.net>
pkgname=graylog
replaces=(graylog2-server graylog-web-interface)
conflicts=(${replaces[*]})
pkgver=2.2.1
pkgrel=1
pkgdesc="Graylog is an open source syslog implementation that stores your logs in ElasticSearch and MongoDB"
arch=('any')
url="https://www.graylog.org/"
license=(GPL)
depends=(java-runtime-headless)
optdepends=('elasticsearch<5.0' mongodb)
install=graylog.install
backup=(
	etc/graylog/server/server.conf
)
source=(
	https://packages.graylog2.org/releases/$pkgname/$pkgname-${pkgver/_/-}.tgz
	graylog-tmpfiles.conf
	graylog.service
)
sha256sums=('c7b322477882880b51e59bdd8d858fe50c59760dffb411d0b4a92f61bd797ca6'
            'SKIP'
            'SKIP')

package() {
	cd "$pkgdir"

	install -d var/lib/graylog/spool
	install -d var/lib/graylog/data/journal
	chown nobody: -R var/lib/graylog/

	for f in "$srcdir/$pkgname-${pkgver/_/-}"/data/contentpacks/*; do
		install -Dm 644 $f usr/lib/graylog/data/contentpacks/${f##*/}
	done

	for f in "$srcdir/$pkgname-${pkgver/_/-}"/plugin/*; do
		install -Dm 644 $f usr/lib/graylog/plugin/${f##*/}
	done

	for f in sigar.jar libsigar-{amd64,x86}-linux.so; do
		install -Dm 644 "$srcdir/$pkgname-${pkgver/_/-}/lib/sigar/$f" usr/lib/graylog/lib/sigar/${f##*/}
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
