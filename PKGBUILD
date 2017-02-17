# Maintainer: Drew Reed <reed.995@osu.edu>
pkgname=openuru-moss
pkgver=r41+.3e78d60a5282+
pkgrel=1
pkgdesc="MOSS is a UNIX-based server for the Myst Online: Uru Live client"
arch=('i686' 'x86_64')
url="openuru.org"
license=('GPL')
depends=('libpqxx'
         'postgresql')
makedepends=()
backup=()
source=("$pkgname::hg+http://foundry.openuru.org/hg/MOSS"
        "include_unistd.patch")
md5sums=('SKIP'
         '923b06d8c25265679bd35e532118f2ff')

prepare() {
    cd "$srcdir"
	patch -p0 -i "include_unistd.patch"
}

build() {
	cd "$srcdir/$pkgname"
    ./bootstrap.sh
	./configure --prefix=/usr --enable-fast-download
	make
    cd "postgresql"
    make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
    cd "postgresql"
    make DESTDIR="$pkgdir/" install
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
