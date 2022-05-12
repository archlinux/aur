# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# vim: ft=sh:

pkgname=kisslinux-init
pkgver=1.0.3
pkgrel=9
pkgdesc="Init framework of KISS Linux"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/kisslinux/init"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'use-os-release.patch'
        'mounts.boot'
        'vconsole.boot'
        'files.boot'
        'modules-load.boot'
)
sha256sums=('889d02e36c5808b1adadaa4e567df3fef97156e38a477579a20e7c53622018d6'
            '8bf4f1866727ceba57e8a6f7608f1f0e88ad078cc486d9b29a3b2228c55a548c'
            'adda171decc0f691b6f59ffc8a3855efd51335c83f79292a6183ac5096adb43f'
            '2e4db40e5690f16d8a351072d3f6ff11b6fb07380ac8feea41fa4166f42d5f43'
            'd128853332ea14c9523c5eacccdb23c4650bf965752d3ff09db2a2c35895fd45'
            '195bcb95264cf892e89fadee3f9b972676c373b08546f2a3eb2685e7cee5a6a4')

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
	install -d "$pkgdir/etc/rc.d"

	install -Dm755 "lib/init/rc.boot" "$pkgdir/usr/lib/init/rc.boot"
	install -Dm755 "lib/init/rc.shutdown" "$pkgdir/usr/lib/init/rc.shutdown"
	install -Dm644 "lib/init/rc.lib" "$pkgdir/usr/lib/init/rc.lib"

    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

	cd ..
	find . -maxdepth 1 -name '*.boot' -or -name '*.shutdown' \
	| while read -r file; do
		install -Dm644 "$file" "$pkgdir/usr/lib/init/rc.d/$file"
	done

}
