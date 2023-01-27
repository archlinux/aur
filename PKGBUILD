# Maintainer: éclairevoyant

pkgname=choosewm
pkgver=0.1.6
_debrel=3.1
pkgrel=3
pkgdesc="Choose WM gui tool. Run it from ~/.xsession or ~/.xinitrc."
arch=('i686' 'x86_64')
url="https://packages.debian.org/unstable/x11/$pkgname"
license=('GPL2')
depends=('gtk2')
backup=("var/lib/$pkgname/windowmanagers")
source=(https://ftp.debian.org/debian/pool/main/c/$pkgname/${pkgname}_$pkgver{.orig.tar.gz,-$_debrel.debian.tar.xz}
        $pkgname-windowmanagers)
sha256sums=('10f1aedfccd3f8c39766cabb017fe3fa1acd349a6cfa0641e55d5e9b0f3b142b'
            '28f3b42798d6ce7e39f9225ce88f09f67c3e04fe911c2d7a352cc8be5d19b344'
            'f6fa084c0fbc0e009acaedd738c16e0fd69ad7b87245186671caa2613620c565')

prepare() {
	cd $pkgname-$pkgver
	cat ../debian/patches/series | while read p; do
		patch -p1 < ../debian/patches/$p
	done
}

build() {
	cd $pkgname-$pkgver
	CPPFLAGS="$(pkg-config --cflags gtk+-2.0)" ./configure --prefix=/usr
	make
}

package() {
	install -Dm644 $pkgname-windowmanagers "$pkgdir/var/lib/choosewm/windowmanagers"

	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
