# Alpine Maintainer: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname="abuild"
pkgver=3.4.0
_ver=${pkgver%_git*}
pkgrel=2
pkgdesc="Script to build Alpine Packages"
url="https://git.alpinelinux.org/cgit/abuild/"
arch=("i686" "x86_64")
license=("GPL2")
makedepends=("zlib" "pkgconfig")
depends=("dash" "glibc" "pax-utils" "openssl" "apk-tools" "attr" "tar" "pkgconf" "lzip" "curl"
"bubblewrap" "gettext" "git")
opt_depends=("perl: for cpan resolver"
             "perl-libwww: for cpan resolver"
             "perl-json: for cpan resolver"
             "perl-module-build-tiny: for cpan resolver"
             "perl-lwp-protocol-https: for cpan resolver"
             "ruby: for gem resolver"
             "ruby-augeas: for gem resolver")
pkggroups="abuild"
source=("https://dev.alpinelinux.org/archive/$pkgname/$pkgname-$_ver.tar.xz")
sha512sums=("0ddf1cef2e79628a4de06015ba217432711ee76751ccc487fd3b1af9cae37ed1b8c5afdc0b916322472314ccee8a6d1c17ccb5b55f6eebfb54444199d2281d3e")

prepare() {
	cd "$srcdir/$pkgname-$_ver"
	sed -i -e "/^CHOST=/s/=.*/=$CARCH/" abuild.conf
}

build() {
	cd "$srcdir/$pkgname-$_ver"
	make VERSION="$pkgver-r$pkgrel"
}

package() {
	cd "$srcdir/$pkgname-$_ver"
	make install VERSION="$pkgver-r$pkgrel" DESTDIR="$pkgdir"
	for bin in "$pkgdir"/usr/bin/*; do
		sed -e "1s|#!/bin/ash|#!/bin/dash|" -i "$bin"
	done
	install -m 644 abuild.conf "$pkgdir"/etc/abuild.conf
	install -d -m 775 -o nobody -g nobody "$pkgdir"/var/cache/distfiles
}
