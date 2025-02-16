# Maintainer: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="freebsd-pkg"
_pkgname="pkg"
pkgver="2.0.6"
pkgrel="1"
pkgdesc="Package management tool for FreeBSD."
url="https://github.com/freebsd/pkg"
license=("BSD-2-Clause")
arch=("i686" "x86_64")

depends=("libarchive" "libbsd" "libelf")
makedepends=("autoconf" "automake" "libtool" "pkgconf")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/freebsd/pkg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("0fdc2986b3dd6ecb0b3c66bfc5999a8770712833ba88277a07ec1a065787a7fc")

build() {
    cd "$_pkgname-$pkgver"

    ./configure --prefix=/usr
    make
}

check() {
	cd "$_pkgname-$pkgver"

	make -k check
}

package() {
    cd "$_pkgname-$pkgver"

    # /usr/etc is a non-standard directory on Linux, and 'make install' does
    # not create it, so we do it ourselves.
    mkdir -p "$pkgdir/usr/etc"

    make DESTDIR="$pkgdir" install

    # /usr/sbin is a symbolic link to /usr/bin on Archlinux, and Pacman does
    # not like packages referencing it.
    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

    # The repository license file does not reference the authors, so we
    # concatenate both files.
    cp COPYING LICENSE
    echo '' >>LICENSE
    cat AUTHORS >>LICENSE

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
