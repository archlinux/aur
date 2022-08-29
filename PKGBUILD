# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname="freebsd-pkg"
_pkgname="pkg"
pkgver="1.18.4"
pkgrel="1"
pkgdesc="Package management tool for FreeBSD."
url="https://github.com/freebsd/pkg"
license=("custom")
arch=("i686" "x86_64")

depends=("libarchive" "libbsd" "libelf")
makedepends=("autoconf" "automake" "libtool" "pkgconf")

source=("https://github.com/freebsd/pkg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("d5e197a8514e147b9dab5fd4a43ddc02efe40ba1b686bd8f530ef21846b3e449")

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
