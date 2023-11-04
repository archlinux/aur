# Maintainer: Dominic Meiser [git at msrd0 dot de]
# Contributor: Clar Fon <them@lightdark.xyz>

pkgname="abuild"
pkgver=3.12.0
_ver=${pkgver%_git*}
pkgrel=1
pkgdesc="Script to build Alpine Packages"
url="https://git.alpinelinux.org/cgit/abuild/"
arch=("i686" "x86_64")
license=("GPL2")
makedepends=("zlib" "pkgconfig" "scdoc")
depends=("busybox" "glibc" "pax-utils" "openssl" "apk-tools" "attr" "tar" "pkgconf" "lzip" "curl" "bubblewrap" "gettext" "git")
optdepends=("perl: for cpan resolver"
            "perl-libwww: for cpan resolver"
            "perl-json: for cpan resolver"
            "perl-module-build-tiny: for cpan resolver"
            "perl-lwp-protocol-https: for cpan resolver"
            "ruby: for gem resolver"
            "ruby-augeas: for gem resolver")
source=("https://gitlab.alpinelinux.org/alpine/abuild/-/archive/$pkgver/abuild-$pkgver.tar.gz")
sha512sums=('00fac67aa96a83f33406dde60bd9526bfa5fdff690b84dbe867b6ed197f147b2afafcdfbda900c005e00a64a42bcb98ca425ffc8bf2158b9540cbb67d935577d')

prepare() {
	cd "$srcdir/$pkgname-$_ver"
	#sed -i -e "/^CHOST=/s/=.*/=$CARCH/" abuild.conf
}

build() {
	cd "$srcdir/$pkgname-$_ver"
	make VERSION="$pkgver-r$pkgrel"
}

package() {
	cd "$srcdir/$pkgname-$_ver"
	make install VERSION="$pkgver-r$pkgrel" DESTDIR="$pkgdir"
	for bin in "$pkgdir"/usr/bin/*; do
		sed -E -i "$bin" \
			-e '1s|#!/bin/ash$|#!/bin/busybox ash|' \
			-e '1s|#!/bin/ash\s+(.*)$|#!/bin/busybox ash\nset \1|'
	done
	install -m 644 abuild.conf "$pkgdir"/etc/abuild.conf
	install -d -m 775 -o nobody -g nobody "$pkgdir"/var/cache/distfiles
}
