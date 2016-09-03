# Maintainer: Onishin <onishin at onishin dot org>
# Co-maintainer: redfish <redfish at galactica dot pw>

# TODO: rename package to monero-git in a few weeks
pkgbase=('bitmonero-git')
pkgname=('bitmonero-git' 'libmonero-wallet-git')
_gitname='monero'
pkgver=0.9.4
pkgrel=6
arch=('x86_64' 'i686' 'armv7h')
url="https://getmonero.org/"
license=('custom:Cryptonote')

depends=('boost-libs>=1.45'  'unbound>=1.4.16'  'miniupnpc>=1.6' 'libunwind' 'openssl')
makedepends=('git' 'cmake' 'boost')


pkgdesc="Peer-to-peer network based anonymous digital currency (includes deaemon, wallet and miner)"
source=("$_gitname::git+https://github.com/monero-project/monero.git"
        "monerod.service"
        "monerod.conf"
        "monero.install"
)
	
md5sums=('SKIP'
         '978b5dda921ad298d93eaf701094f835'
         '7115d61857ce249a3e9ccf2c6bc4f00b'
         '22c9f8201e5c97c9e1595de26f401d92')

_builddir=build

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"

	if check_option "debug" "y"
	then
		_buildtype="Debug"
	else
		_buildtype+="Release"
	fi

	CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=$_buildtype "
	CMAKE_FLAGS+=" -DCMAKE_INSTALL_PREFIX=/usr "
	CMAKE_FLAGS+=" -DBUILD_TESTS=ON "
	CMAKE_FLAGS+=" -DBUILD_GUI_DEPS=ON "
	CMAKE_FLAGS+=" -Wno-dev " # silence warnings for devs
	CMAKE_FLAGS+=" -DCMAKE_LINKER=/usr/bin/ld.gold " # #974 ld segfault on ARM

	mkdir -p $_builddir && cd $_builddir
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

package_bitmonero-git() {

	provides=('bitmonero')
	conflicts=('bitmonero')

	backup=('etc/monerod.conf')
	install=monero.install

        # Uncomment for a debug build
        # options=(!strip debug)

	install -D -m755 "$srcdir/$_gitname/build/bin/monerod" "$pkgdir/usr/bin/monerod"
	install -D -m755 "$srcdir/$_gitname/build/bin/monero-wallet-cli" "$pkgdir/usr/bin/monero-wallet-cli"
	install -D -m755 "$srcdir/$_gitname/build/bin/monero-blockchain-import" "$pkgdir/usr/bin/monero-blockchain-import"
	install -D -m755 "$srcdir/$_gitname/build/bin/monero-blockchain-export" "$pkgdir/usr/bin/monero-blockchain-export"

	install -Dm644 $srcdir/monerod.service "${pkgdir}/usr/lib/systemd/system/monerod.service"
	install -Dm644 "$srcdir/monerod.conf" "$pkgdir/etc/monerod.conf"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libmonero-wallet-git() {

	provides=('libmonero-wallet' 'libmonerowallet-git')
	conflicts=('libmonero-wallet' 'libmonerowallet-git')

        # NOTE: this is crucial, otherwise stripping breaks the .a archive:
        # monero-core (GUI) fails to link against it (it can't find symbols
        # that are clearly in the library).
        options=(!strip)

        cd $srcdir/$_gitname/$_builddir
        make DESTDIR=$pkgdir install
}
