# Maintainer: George Tellalov <gtellalov at gmail dot com>
pkgname=gbgoffice
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="Bulgarian English two-way dictionary"
arch=('x86_64')
url="http://gbgoffice.info"
license=('GPL2')
groups=()
depends=('gtkmm')
source=("http://gbgoffice.info/d/$pkgname-$pkgver.tar.gz"
        "https://deb.debian.org/debian/pool/main/g/$pkgname/${pkgname}_$pkgver-11.debian.tar.xz"
        "https://sourceforge.net/projects/bgoffice/files/Full%20Pack%20of%20Dictionaries/1.0/full-pack.tar.bz2/download")
sha256sums=('e4459bdde092eefb8bf84d9a915fcf07760d51c36ded3b74f280c614e0ae3561'
            '65f43ffea1afb4642681605ff8417df87038141b945623ea8429551f19de7baa'
            'ebb46679dba292636e8b2a5eea132e7dddb949e37b402315327303fb5f12aed8')
prepare() {
	cd "$pkgname-$pkgver"
	for patch in $(cat ../debian/patches/series); do
        patch -p1 < ../debian/patches/$patch
    done
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
    install -Dm644 -vt "$pkgdir/usr/share/bgoffice/" full-pack/data/*
    install -Dm644 -vt "$pkgdir/usr/share/applications/" \
            debian/gbgoffice.desktop
	cd "$pkgname-$pkgver"
    install -Dm644 -vT pixmaps/gbgoffice-icon.png \
            "$pkgdir/usr/share/pixmaps/gbgoffice.png"
	make DESTDIR="$pkgdir/" install
}
