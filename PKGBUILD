# Contributors:
#	henning mueller <henning@orgizm.net>

pkgname=asleap
pkgver=2.2
pkgrel=3
pkgdesc='Actively recover LEAP/PPTP passwords.'
arch=(x86_64)
license=(GPL)
url=http://www.willhackforsushi.com/Asleap.html
depends=(openssl libpcap)
source=(
	http://www.willhackforsushi.com/code/asleap/$pkgver/asleap-$pkgver.tgz
	libxcrypt1.deb::http://mirrors.kernel.org/ubuntu/pool/universe/libx/libxcrypt/libxcrypt1_2.4-4_amd64.deb
	libxcrypt-dev.deb::http://mirrors.kernel.org/ubuntu/pool/universe/libx/libxcrypt/libxcrypt-dev_2.4-4_amd64.deb
	libxcrypt.patch
)
noextract=(
	libxcrypt1.deb
	libxcrypt-dev.deb
	libxcrypt.patch
)
md5sums=(
	a1d06729fb2addcc5b09bfc14f9b3173
	SKIP
	SKIP
	SKIP
)

prepare() {
    mkdir deb
	ar p libxcrypt1.deb data.tar.xz | tar xJC deb
	ar p libxcrypt-dev.deb data.tar.xz | tar xJC deb

	cd $srcdir/asleap-$pkgver
	patch --forward --strip=1 --input="${srcdir}/libxcrypt.patch"
}

build() {
	cd $srcdir/asleap-$pkgver
	make
}

package() {
	cd $srcdir/asleap-$pkgver
	install -D asleap $pkgdir/usr/bin/asleap
	install -D genkeys $pkgdir/usr/bin/genkeys

	cd $srcdir/deb
	install -dv $pkgdir/usr/lib
	mv lib/libxcrypt.so.1.2.4 $pkgdir/usr/lib
	ln -s /usr/lib/libxcrypt.so.1.2.4 $pkgdir/usr/lib/libxcrypt.so
	ln -s /usr/lib/libxcrypt.so.1.2.4 $pkgdir/usr/lib/libxcrypt.so.1
}
