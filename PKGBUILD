# Maintainer: Dominic Meiser [git at msrd0 dot de]
# Contributor: Clar Fon <them@lightdark.xyz>

pkgname="abuild"
pkgver=3.11.21
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
sha512sums=('798cfed101c8660feb872375353a99065642220d5b6e88779b87716f5b50a456f456d24b9c9def8ebe4e01a3e67a080c2686cf6f54a4410b364ed98f4fcbbec8')

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
