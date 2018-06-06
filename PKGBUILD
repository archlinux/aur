# Maintainer: Spider.007 <aur@spider007.net>
pkgname=graylog
replaces=(graylog2-server graylog-web-interface)
conflicts=(${replaces[*]})
pkgver=2.4.5
pkgrel=1
pkgdesc="Graylog is an open source syslog implementation that stores your logs in ElasticSearch and MongoDB"
arch=('any')
url="https://www.graylog.org/"
license=(GPL)
depends=('java-runtime-headless=8')
optdepends=('elasticsearch' mongodb)
install=graylog.install
backup=(
	etc/graylog/server/server.conf
)
source=(
	https://packages.graylog2.org/releases/$pkgname/$pkgname-${pkgver/_/-}.tgz
	graylog-tmpfiles.conf
	graylog.service
)
sha256sums=('9e66c5f024dfe6c16f4d2d8bd8e668c77a5afb549e188edb40356862dcc96879'
            '4d3c0bb83c7a02a5a902670b060d045068f5201728194a4473b2c2ba99bbd43d'
            'f9f3d3bd670d7889eb6053b016d365f37eaa9b736c9076ae101b3efeab7f428f')

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
