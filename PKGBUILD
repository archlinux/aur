# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>
pkgname=zzuf
pkgver=0.13.svn20100215
_ver=0.13
pkgrel=1
pkgdesc="Transparent application input fuzzer."
url="http://caca.zoy.org/wiki/zzuf"
arch=('i686' 'x86_64')
license=('custom')
options=('!buildflags' '!libtool' '!staticlibs')
depends=('glibc')
changelog=Changelog
source=("http://ftp.debian.org/debian/pool/main/z/zzuf/zzuf_${pkgver}.orig.tar.gz"
        '100_more_tolerant_test.diff'
        '200_libc_symbol_versioning.diff')
sha256sums=('012b195cdc8e6c62fc25e4e357a5fd9d686d5b4faa59a8fcf7fb0d0906ebcff4'
            '5aecac85a56fc2bb4d8d1402aee4fa78f709bb6cde24338b53c2809039e7a936'
            '788adac61b5632867e2a685fe7db771e209cfefdd15343d861fba04fbee858fb')

prepare() {
	cd $srcdir/$pkgname-$_ver

	# apply Debian patches
	for patch in ../*.diff ; do
		patch -Np1 -i $patch
	done
}

build() {
	cd $srcdir/$pkgname-$_ver
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname-$_ver
	make check
}

package() {
	cd $srcdir/$pkgname-$_ver
	make DESTDIR=$pkgdir install

	# license
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 \
		AUTHORS \
		NEWS \
		README \
		TODO \
		$pkgdir/usr/share/doc/$pkgname
}

