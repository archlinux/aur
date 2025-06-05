# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: SebOuellette

pkgname=tizen-sdb
pkgver=2.3.2
pkgrel=3
pkgdesc="Tizen Smart Development Bridge"
arch=('i686' 'x86_64')
url="https://github.com/TizenTeam/sdb"
license=('Apache')
groups=()
provides=('tizen-sdb')
source=("git://git.tizen.org/sdk/tools/sdb"
	"https://github.com/openssl/openssl/releases/download/OpenSSL_1_0_1u/openssl-1.0.1u.tar.gz"
	"gcc10p_build.patch")
sha512sums=('SKIP'
            '54938aac2b9a2ebce9e6b923e3c44d889f1e201f560d9011394e5c0f4dcbdae35548b0ac8e33a4bc2f11a3ef4701be9f49459bb21b4322dc78a81f091c5cda0a'
            'e893ae5bb2491a222ee739bac41ff2b8b9ad3c9c86e699db22082536d39209f0e0b05fd00e2c404257f19c5f08a134967e4aeb29d03f77c9937660eee7a57480')

prepare() {
	# 1. Prepare SDB
	cd $srcdir/sdb
	git checkout origin/tizen_studio
	patch -p1 < ../gcc10p_build.patch

	# 2. Prepare openssl-1.0.1u
	cd $srcdir
	tar -xzf openssl-1.0.1u.tar.gz
	cd $srcdir/openssl-1.0.1u
	./config
	make
	cp libcrypto.a $srcdir/sdb/lib/libcrypto_lin.a
}

build() {
	cd $srcdir/sdb
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/sdb/bin/sdb" "$pkgdir/usr/bin/"
}
