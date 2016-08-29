# Maintainer: Onishin <onishin at onishin dot org>
# Co-maintainer: redfish <redfish at galactica dot pw>

pkgname='bitmonero-git'
_gitname='bitmonero'
pkgver=0.9.4
pkgrel=4
arch=('x86_64' 'i686' 'armv7h')
url="https://getmonero.org/"
license=('custom:Cryptonote')

depends=('boost-libs>=1.45'  'unbound>=1.4.16'  'miniupnpc>=1.6' 'libunwind')
makedepends=('git' 'cmake' 'boost')


pkgdesc="Peer-to-peer network based anonymous digital currency (includes deaemon, wallet and miner)"
provides=('bitmonerod' 'simplewallet' 'simpleminer')
conflicts=('bitmonerod' 'simplewallet' 'simpleminer')
source=("$_gitname::git+https://github.com/monero-project/bitmonero.git"
        "bitmonerod.service"
        "bitmonerod.conf"
        "bitmonero.install"  
)
	
md5sums=('SKIP'
         '9e8e52d5379c534e9cde86e5d6c39592' 
         'eb04582e2007f8e450322c1794ed30ba' 
         '513a3ff4be5cb6f3faf13ffcb680b941')



backup=('etc/bitmonerod.conf')
install=bitmonero.install

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"

	CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=Release "
	CMAKE_FLAGS+=" -DBUILD_TESTS=ON "
	CMAKE_FLAGS+=" -Wno-dev " # silence warnings for devs
	CMAKE_FLAGS+=" -DCMAKE_LINKER=/usr/bin/ld.gold " # #974 ld segfault on ARM

	mkdir -p build && cd build
	cmake $CMAKE_FLAGS ..
	make
}

check() {
	cd "$srcdir/$_gitname"
	cd build

	# Temporarily disable some a tests:
	#  * coretests takes too long (~25000s)
	#  * libwallet_api_tests fail (Issue #895)
	CTEST_ARGS+="-E 'coretests|libwallet_api_tests'"
	echo ">>> NOTE: some tests excluded: $CTEST_ARGS"

	make ARGS="$CTEST_ARGS" test
}

package() {

	install -D -m755 "$srcdir/$_gitname/build/bin/bitmonerod" "$pkgdir/usr/bin/bitmonerod"
	install -D -m755 "$srcdir/$_gitname/build/bin/simplewallet" "$pkgdir/usr/bin/simplewallet"
	install -D -m755 "$srcdir/$_gitname/build/bin/simpleminer" "$pkgdir/usr/bin/simpleminer"
	install -D -m755 "$srcdir/$_gitname/build/bin/blockchain_import" "$pkgdir/usr/bin/bitmonero-import"
	install -D -m755 "$srcdir/$_gitname/build/bin/blockchain_export" "$pkgdir/usr/bin/bitmonero-export"
	install -D -m755 "$srcdir/$_gitname/build/bin/blockchain_dump" "$pkgdir/usr/bin/bitmonero-dump"
	install -D -m755 "$srcdir/$_gitname/build/bin/cn_deserialize" "$pkgdir/usr/bin/bitmonero-deserialize"

	install -Dm644 $srcdir/bitmonerod.service "${pkgdir}/usr/lib/systemd/system/bitmonerod.service"
	install -Dm644 "$srcdir/bitmonerod.conf" "$pkgdir/etc/bitmonerod.conf"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
