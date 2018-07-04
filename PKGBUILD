# Creator: Jack Tripper <jack@jtripper.net>
# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=dns-proxy-git
pkgver=20180701
pkgrel=1
pkgdesc="A transparent DNS-over-SOCKS proxy for use with transparent SOCKS proxies."
arch=("any")
makedepends=('git')
url="https://github.com/cookiengineer/dns-proxy"
license=('GPL')
provides=('dns-proxy' 'dns-proxy.service')
_gitroot="git://github.com/cookiengineer/dns-proxy.git"
_gitname="dns-socks-proxy"

build() {
	cd "$srcdir";
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin;
		msg "The local files are updated.";
	else
		git clone $_gitroot $_gitname;
	fi;

	cd "$srcdir/$_gitname";
	make;

}

package() {

	cd "$srcdir/$_gitname";
	install -Dm755 dns-proxy "$pkgdir/usr/bin/dns-proxy";
	sed -i 's#resolv\.conf#/etc/dns-proxy/resolv.conf#g' dns-proxy.conf;
	install -Dm644 dns-proxy.conf "$pkgdir/etc/dns-proxy/dns-proxy.conf";
	install -Dm644 resolv.conf "$pkgdir/etc/dns-proxy/resolv.conf";
	install -Dm755 package/arch-linux/dns-proxy.service "$pkgdir/usr/lib/systemd/system/dns-proxy.service";

}

