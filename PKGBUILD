# Maintainer: SanskritFritz (gmail)

pkgname=netdata-git
_gitname=netdata
pkgver=v1.3.0.r154.ge55f4ed
pkgrel=1
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web."
url="https://github.com/firehol/netdata/wiki"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'libmnl' 'libnetfilter_acct' 'zlib')
optdepends=('nodejs: Webbox plugin')
source=("$_gitname::git+https://github.com/firehol/netdata")
provides=('netdata')
conflicts=('netdata')
#backup=('etc/netdata/netdata.conf' 'etc/netdata/charts.d.conf' 'etc/netdata/apps_groups.conf')
backup=('etc/netdata/'{apps_groups,charts.d,health_alarm_notify,health_email_recipients,netdata,python.d}.conf
        'etc/netdata/health.d/'{apache,cpu,disks,entropy,memcached,mysql,named,net,nginx,qos,ram,redis,retroshare,squid,swap}.conf
        'etc/netdata/python.d/'{apache_cache,apache,cpufreq,dovecot,example,exim,hddtemp,ipfs,memcached,mysql,nginx,nginx_log,phpfpm,postfix,redis,retroshare,sensors,squid,tomcat}.conf)
install="$pkgname.install"

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
 	install -Dm0644 "system/netdata.service" "$pkgdir/usr/lib/systemd/system/netdata.service"
}

md5sums=('SKIP')
