# Kekeke
# Maintainer: Your Name <youremail@domain.com>
pkgname=greyd
pkgver=0.9.2
pkgrel=5
pkgdesc="Lightweight greylisting & blacklisting daemon based on OpenBSD spamd"
arch=('i686' 'x86_64')
url="http://greyd.org/"
license=('BSD')

depends=('zlib' 'libtool' 'libgcrypt' 'ipset'
 'libnetfilter_conntrack' 'libnetfilter_log'
 'db' 'iptables' 'libspf2')
makedepends=('libtool' 'autoconf' 'automake' 'gcc' 'make' 'patch')

source=("https://github.com/mikey-austin/greyd/archive/v0.9.2.tar.gz" "greyd.conf" "greydctl" "greyd.service")
install=greyd.install

md5sums=('c777b694d9ca349b6fa952bfdfdb6433'
         'c4c05842a1ff7706616d5f49b83b67bf'
         'bec202f3c8f00d7c917f423b0eda66f6'
         '61023296035deb3d685b296c3fca9d68')
prepare() {
    cd "$pkgname-$pkgver"
    aclocal
    autoheader
    libtoolize
    automake -ac
    autoconf
}
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-netfilter --with-bdb --without-spf
	make clean && make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m 0644 "$srcdir/greyd.conf" "$pkgdir/etc/greyd/greyd.conf"
	install -m 0755 "$srcdir/greydctl" "$pkgdir/usr/bin/greydctl"
	install -m 0644 "$srcdir/greyd.service" "$pkgdir/usr/lib/systemd/system/greyd.service"
}
