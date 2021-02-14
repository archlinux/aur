# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada-libfswatch-git
pkgver=r16.94c0a5f
pkgrel=1

pkgdesc='High level string and text processing library'
url='https://github.com/AdaCore/ada_libfswatch'
arch=('x86_64')
license=('GPL3')

depends=('gcc-libs' 'fswatch')
makedepends=('git')

provides=('ada-libfswatch')

source=('git+https://github.com/AdaCore/ada_libfswatch.git' 'ada-libfswatch-git.patch')
sha1sums=('SKIP'
          'cb3ddf5c8e8c5988c2f60111dfc18e132db00617')

pkgver() {
    cd "$srcdir/ada_libfswatch"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/ada_libfswatch"
	git apply $srcdir/ada-libfswatch-git.patch
}

build() {
    cd "$srcdir/ada_libfswatch"
	make
}

package() {
    cd "$srcdir/ada_libfswatch"

	make install DESTDIR="$pkgdir/usr"

    # gprinstall installs a soft link for /usr/lib/libfswatch.so which is already owned by fswatch
    # Remove it
    rm "$pkgdir/usr/lib/libfswatch.so"
}
