pkgname=xt_tls
pkgver=0.3.4
pkgrel=1
pkgdesc="an extension for netfilter/IPtables that allows you to filter traffic based on TLS hostnames"
arch=(x86_64)
url="https://github.com/Lochnair/xt_tls"
license=('GPL')
makedepends=('iptables')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lochnair/xt_tls/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1069cfdf53e0d8c2f518149d70595eaa7bf3f835b7cc2a24b4ce7cd7c1157a3f')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's#void _init(void)#static void __attribute__((constructor)) IPTABLES_MODULE_MAIN(void)#' ipt/libxt_tls.c
	sed -i 's#install -D -v -m 644 libxt_tls.so $(DESTDIR)$(XTABLES_LIB)#install -D -v -m 644 libxt_tls.so $(DESTDIR)$(XTABLES_LIB)/libxt_tls.so#' ipt/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make -C ipt
}

package() {
	cd "$pkgname-$pkgver"
	make -C ipt DESTDIR="$pkgdir/" install
	install -dm0755 "$pkgdir"/usr/src/$pkgname-$pkgver
	cp -r src/* "$pkgdir"/usr/src/$pkgname-$pkgver/
	cat >"$pkgdir"/usr/src/$pkgname-$pkgver/dkms.conf <<EOF
PACKAGE_NAME=xt_tls
PACKAGE_VERSION=$pkgver
AUTOINSTALL=yes

BUILT_MODULE_NAME[0]=xt_tls
DEST_MODULE_LOCATION[0]="/updates"
EOF
}
