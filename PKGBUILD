# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Maintainer: Noel Kuntze <noel.kuntze@thermi.consulting>
pkgname=libmdbx
pkgver=0.10.2
pkgrel=1
pkgdesc="Extremely fast, compact, powerful, embedded, transactional key-value database, with permissive license."
url="https://github.com/erthink/libmdbx"
arch=(x86_64)
license=(OLDAP-2.8)
makedepends=(linux-headers bash cmake)
subpackages="$pkgname-dev $pkgname-doc $pkgname-dbg"
#noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/erthink/libmdbx/archive/refs/tags/v$pkgver.tar.gz"
		"0001-mdbx-Remove-all-checks-for-amalgated-or-git-source-i.patch")

# _make_args="SHELL=bash MDBX_GIT_TREE=160b2d1d503c72a1fc92e62ad4e7d349e0d84ccd \
# 	MDBX_GIT_COMMIT=50328de63cec1c3ec689515669f6ce2f7a42abb6 MDBX_GIT_DESCRIBE=v0.10.1-0-g50328de MDBX_GIT_REVISION=0 \
# 	MDBX_GIT_VERSION=$pkgver MDBX_GIT_TIMESTAMP=2021-06-01T03:21:59+03:00
# 	MDBX_BUILD_SOURCERY=60c038549283f9c726575aea9038e3be3c43b15fbc8c58460103259659373dc6_v0_10_1_5_g18bc28b"

prepare() {
	#rm -rf "$srcdir/$pkgname-$pkgver"
	#mkdir -p "$srcdir/$pkgname-$pkgver"
	#tar -C "$srcdir/$pkgname-$pkgver" -xf "$srcdir/$pkgname-$pkgver.tar.gz" 
	cd "$srcdir/$pkgname-$pkgver/"
	patch < "$srcdir/0001-mdbx-Remove-all-checks-for-amalgated-or-git-source-i.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	echo "$pkgver.0" > VERSION
	export CFLAGS="$CFLAGS -fPIC -Wno-int-to-pointer-cast"
	cmake . -DMDBX_ENABLE_TESTS=True
	make -f Makefile all prefix=/
}

check() {
	cd "$srcdir/$pkgname-$pkgver/"
	export CFLAGS="$CFLAGS -fPIC -Wno-int-to-pointer-cast"
	cmake . -DMDBX_ENABLE_TESTS=True
	make -f Makefile mdbx-test test-singleprocess build-test TEST_DB=/tmp/mdbx-test.db TEST_LOG=/tmp/mdbx-test.log.gz
	rm /tmp/mdbx-test.*
}

package() {
	# Replace with proper package command(s)
	cd "$srcdir/$pkgname-$pkgver/"
	export CFLAGS="$CFLAGS -fPIC -Wno-int-to-pointer-cast"
	cmake . -DMDBX_ENABLE_TESTS=True -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_DO_STRIP=False -DMDBX_MAN_INSTALL_DESTINATION=/usr/share/man/man1 \
		-DMDBX_TOOLS_INSTALL_DESTINATION=/usr/bin -DMDBX_DLL_INSTALL_DESTINATION=/usr/lib
	make -f Makefile install DESTDIR="$pkgdir"
}

sha512sums=('3d5f127a140841db6c89815adf65fdaefc4bb1d7941bfd1922c54ba38589dd49c6d6f5cd1dcf1b042c526c848cc6900eb80ee51fd8b2c0cabfe4a34c5678663e'
            '5e5fef4219279b10f0d4371fcbf3e2d4a7d958eb337f9de92aebb6a7d0d6644faa65eb804f46021678997a638ac601b03d9facbbf1164b45ae9075384d300df2')
