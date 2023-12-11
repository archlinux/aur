# Maintainer: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="freebsd-pkg"
_pkgname="pkg"
pkgver="1.20.0"
pkgrel="1"
pkgdesc="Package management tool for FreeBSD."
url="https://github.com/freebsd/pkg"
license=("custom")
arch=("i686" "x86_64")

depends=("libarchive" "libbsd" "libelf")
makedepends=("autoconf" "automake" "libtool" "pkgconf")

source=("https://github.com/freebsd/pkg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("bce659b9d50f3e341afe12ac9b367d4d455ac380e5f6c319095c5b26f42538ee")

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
