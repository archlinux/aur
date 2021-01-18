# Alpine Maintainer: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname="abuild"
pkgver=3.7.0
_ver=${pkgver%_git*}
pkgrel=1
pkgdesc="Script to build Alpine Packages"
url="https://git.alpinelinux.org/cgit/abuild/"
arch=("i686" "x86_64")
license=("GPL2")
makedepends=("zlib" "pkgconfig")
depends=("busybox" "glibc" "pax-utils" "openssl" "apk-tools" "attr" "tar" "pkgconf" "lzip" "curl"
"bubblewrap" "gettext" "git")
opt_depends=("perl: for cpan resolver"
             "perl-libwww: for cpan resolver"
             "perl-json: for cpan resolver"
             "perl-module-build-tiny: for cpan resolver"
             "perl-lwp-protocol-https: for cpan resolver"
             "ruby: for gem resolver"
             "ruby-augeas: for gem resolver")
pkggroups="abuild"
source=("https://git.alpinelinux.org/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d807cf37a355e1a43e9cb34108a301e6823b4502e7d932097027c62434bde94cc2a439d4c95c882a1cea41ad8b32424e323be20b163c59e8b1747e670a9f3909')

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
		sed -e "1s|#!/bin/ash|#!/bin/busybox ash|" -i "$bin"
	done
	install -m 644 abuild.conf "$pkgdir"/etc/abuild.conf
	install -d -m 775 -o nobody -g nobody "$pkgdir"/var/cache/distfiles
}
