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
makedepends=('mercurial')
backup=('etc/moss/moss.cfg'
        'etc/moss/moss_backend.cfg')
source=("$pkgname::hg+http://foundry.openuru.org/hg/MOSS"
        "include_unistd.patch"
        "moss.service"
        "moss_backend.service")
md5sums=('SKIP'
         '923b06d8c25265679bd35e532118f2ff'
         'd526247b757050c81679b9a7c5a6fae9'
         'fceb9167b73375048e95f55458388d47')

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
	cd "$srcdir"
    install -Dm644 moss.service $pkgdir/usr/lib/systemd/user/moss.service
    install -Dm644 moss_backend.service $pkgdir/usr/lib/systemd/user/moss_backend.service
    cd "$pkgname"
	make DESTDIR="$pkgdir/" install
    install -Dm644 main.cfg $pkgdir/etc/moss/moss.cfg
    install -Dm600 backend.cfg $pkgdir/etc/moss/moss_backend.cfg

    cd "postgresql"
    make DESTDIR="$pkgdir/" install
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
