# Creator: Jack Tripper <jack@jtripper.net>
# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=dns-proxy-git
pkgver=r56.5785038
pkgrel=1
pkgdesc='A transparent DNS-over-SOCKS proxy for use with transparent SOCKS proxies.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
makedepends=('git')
url='https://github.com/cookiengineer/dns-proxy'
license=('GPL')
provides=('dns-proxy' 'dns-proxy.service')
backup=('etc/dns-proxy/dns-proxy.conf'
	'etc/dns-proxy/resolv.conf')
source=('git+https://github.com/cookiengineer/dns-proxy.git')
sha256sums=(SKIP)

_gitroot="git://github.com/cookiengineer/dns-proxy.git"
_gitname="dns-proxy"

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {

	cd "${srcdir}/${_gitname}"
	install -Dm755 dns-proxy "$pkgdir/usr/bin/dns-proxy";
	sed -i 's#resolv\.conf#/etc/dns-proxy/resolv.conf#g' dns-proxy.conf;
	install -Dm644 dns-proxy.conf "$pkgdir/etc/dns-proxy/dns-proxy.conf";
	install -Dm644 resolv.conf "$pkgdir/etc/dns-proxy/resolv.conf";
	install -Dm755 package/arch-linux/dns-proxy.service "$pkgdir/usr/lib/systemd/system/dns-proxy.service";

}

