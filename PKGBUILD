pkgname=scute
pkgver=1.3.0.r64.g94eeb2d
pkgrel=1
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(gnupg)
makedepends=(
	# TODO: Figure out how to make doc work
)
source=("git://git.gnupg.org/scute.git#commit=94eeb2d580f67bd56ba711e055d9ea2ea089ec89")
sha256sums=('SKIP')

pkgver() {
	cd scute
	git describe | sed "s/^scute-//; s/-/.r/; s/-/./"
}

prepare() {
	cd scute
	# Can't find version.texi?
	sed -i '/^SUBDIRS/{s/ doc//}' Makefile.am
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd scute
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd scute
	make DESTDIR="$pkgdir" install

	mkdir -p "$pkgdir"/usr/lib/pkcs11
	ln -s ../scute.so "$pkgdir"/usr/lib/pkcs11/scute.so

	mkdir -p "$pkgdir"/usr/share/p11-kit/modules
	echo "module: scute.so" > "$pkgdir"/usr/share/p11-kit/modules/scute.module
}
