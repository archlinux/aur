# Maintainer: SanskritFritz (gmail)

pkgname=netdata-git
_gitname=netdata
pkgver=v1.0.0.r22.g8209164
pkgrel=1
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web."
url="https://github.com/firehol/netdata/wiki"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmnl' 'libnetfilter_acct' 'zlib')
optdepends=('nodejs: Webbox plugin')
source=("$_gitname::git+https://github.com/firehol/netdata")
provides=('netdata')
conflicts=('netdata')
backup=('etc/netdata/netdata.conf' 'etc/netdata/charts.d.conf' 'etc/netdata/apps_groups.conf')
install="$pkgname.install"


pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	sed -i "s#/usr/sbin/netdata#/usr/bin/netdata#" "system/netdata-systemd"
	sed -i "s#/bin/kill#/usr/bin/kill#" "system/netdata-systemd"
	# http://article.gmane.org/gmane.comp.security.firewalls.firehol.devel/898
	# sed -i "s#<script>var netdataTheme = 'slate';</script>##" "web/index.html"
}

build() {
	cd "$_gitname"

	./autogen.sh
	./configure \
		--prefix="/usr" \
		--sbindir="/usr/bin" \
		--sysconfdir="/etc" \
		--libexecdir="/usr/lib" \
		--localstatedir="/var" \
		--with-zlib --with-math --with-user=netdata \
		CFLAGS="-O3"
	make
}

package() {
	cd "$_gitname"

	make DESTDIR="$pkgdir" install

	touch "$pkgdir/etc/netdata/netdata.conf"
	install -Dm0644 "system/netdata-systemd" "$pkgdir/usr/lib/systemd/system/netdata.service"
}

md5sums=('SKIP')
