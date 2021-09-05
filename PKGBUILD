# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# vim: ft=sh:

pkgname=kisslinux-init
pkgver=1.0.3
pkgrel=3
pkgdesc="Init framework of KISS Linux"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/kisslinux/init"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "use-os-release.patch")
sha256sums=('889d02e36c5808b1adadaa4e567df3fef97156e38a477579a20e7c53622018d6'
            '8bf4f1866727ceba57e8a6f7608f1f0e88ad078cc486d9b29a3b2228c55a548c')

build() {
	cd "${pkgname#*-}-$pkgver/bin"
	for i in kall.c kpow.c; do
		gcc "$i" -O2 -static -o "${i%.c}"
	done
	cd ..
	patch "lib/init/rc.boot" "../use-os-release.patch"
}

package() {
	cd "${pkgname#*-}-$pkgver"
	install -Dsm755 "bin/kall" "$pkgdir/usr/bin/kall"
	install -Dsm755 "bin/kpow" "$pkgdir/usr/bin/kpow"
	install -Dm644 "etc/rc.conf" "$pkgdir/etc/rc.conf"
	install -Dm755 "lib/init/rc.boot" "$pkgdir/usr/lib/init/rc.boot"
	install -Dm755 "lib/init/rc.shutdown" "$pkgdir/usr/lib/init/rc.shutdown"
	install -Dm644 "lib/init/rc.lib" "$pkgdir/usr/lib/init/rc.lib"
	install -d "$pkgdir/usr/lib/init/rc.d"
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
