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
install=openuru-moss.install
source=("$pkgname::hg+http://foundry.openuru.org/hg/MOSS"
        "include_unistd.patch"
        "moss.service"
        "moss-backend.service"
        "backend.cfg.patch"
        "main.cfg.patch")

md5sums=('SKIP'
         '923b06d8c25265679bd35e532118f2ff'
         'b3ad8841685bb3ee6b34cfb3ed0a1c30'
         '65834289d108b7f87d1c9e2339be6ca7'
         '36d6ab8ca9bfec4d401bae097e0fd9f4'
         '112eed405369c984349bf78d47500227')

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
    mkdir -p $pkgdir/var/log/moss

	cd "$srcdir"
	patch -p0 -i "backend.cfg.patch"
	patch -p0 -i "main.cfg.patch"
    install -Dm644 moss.service $pkgdir/usr/lib/systemd/system/moss.service
    install -Dm644 moss-backend.service $pkgdir/usr/lib/systemd/system/moss-backend.service

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
