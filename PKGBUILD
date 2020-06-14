# Maintainer: redfish <redfish at galactica dot pw>
# Co-maintainer: Onishin <onishin at onishin dot org>

pkgbase='monero-git'
pkgname=('monero-git' 'libmonero-wallet-git')
_gitname='monero'
pkgver=0.16.0.0
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://getmonero.org/"
license=('custom:Cryptonote')

depends=('boost-libs>=1.45'  'openssl' 'libunwind' 'readline' 'zeromq' 'pcsclite'
	 'hidapi' 'protobuf')
makedepends=('git' 'cmake' 'boost' 'gtest' 'qt5-tools')
checkdepends=('python-requests')

pkgdesc="Peer-to-peer anonymous digital currency (daemon, CLI wallet, and wallet API library)"
_upstream=https://github.com/monero-project/monero.git
source=("$_gitname::git+$_upstream"
	'cmake-headers.patch')

_builddir=build


pkgver() {
	cd "$srcdir/$_gitname"

	# Release tags might point to commits on a branch different than master,
	# so don't use them.
	#git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
        printf "$(echo $pkgver | sed 's/\.r.*//').r%s.g%s" \
	        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
       cd "$srcdir/$_gitname"

       patch -p1 < $srcdir/cmake-headers.patch

       git submodule init
       git submodule update

       # To apply PRs
       #git remote add up $_upstream
       #git pull --no-edit up refs/pull/xxxx/head
}

CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=$_buildtype "
CMAKE_FLAGS+=" -DCMAKE_INSTALL_PREFIX=/usr "
CMAKE_FLAGS+=" -DBUILD_GUI_DEPS=ON "
CMAKE_FLAGS+=" -DUSE_DEVICE_TREZOR=ON "
CMAKE_FLAGS+=" -Wno-dev " # silence warnings for devs

build() {
	cd "$srcdir/$_gitname"

	if check_option "debug" "y"
	then
		_buildtype="Debug"
	else
		_buildtype+="Release"
	fi

	# For OpenSSL v1.0
	#CMAKE_FLAGS+=" -DOPENSSL_ROOT_DIR='/usr/include/openssl-1.0;/usr/lib/openssl-1.0 "

	mkdir -p $_builddir && cd $_builddir
	cmake $CMAKE_FLAGS -DBUILD_TESTS=OFF ..
	make
}

check() {
	cd "$srcdir/$_gitname"
	cd $_builddir

	cmake $CMAKE_FLAGS -DBUILD_TESTS=ON ..
	make

	# reported by AUR users that this test still fails (on some machines)
	EXCLUDED_UNIT_TESTS+=':AddressFromURL.Failure'
	EXCLUDED_UNIT_TESTS+=':is_hdd.linux_os_root' # fails on SSD (PR#4474)
	tests/unit_tests/unit_tests --gtest_filter="-$EXCLUDED_UNIT_TESTS" \
            --data-dir ../tests/data

	# Temporarily disable some a tests:
	#  * coretests, hash-variant2-int-sqrt take too long (~25000s, 250s)
	#  * libwallet_api_tests fail (Issue #895)
	#  * unit_tests were run separately above
	#  * functional_tests_rpc: take too lon (~1000s on ARM)
	#  * cnv4-jit: take too lon (~1000s on ARM)
	CTEST_ARGS+="-E 'core_tests|hash-variant2-int-sqrt|libwallet_api_tests|unit_tests|functional_tests_rpc|cnv4-jit'"
	echo ">>> NOTE: some tests excluded: $CTEST_ARGS"

	make ARGS="$CTEST_ARGS" test
}

package_monero-git() {

	provides=('monero')
	conflicts=('monero')

	backup=('etc/monerod.conf')
	install=monero.install

        # Uncomment for a debug build
        # options=(!strip debug)

	for b in \
		monero-blockchain-ancestry \
		monero-blockchain-depth \
		monero-blockchain-export \
		monero-blockchain-import \
		monero-blockchain-mark-spent-outputs \
		monero-blockchain-prune \
		monero-blockchain-prune-known-spent-data \
		monero-blockchain-stats \
		monero-blockchain-usage \
		monerod \
		monero-gen-trusted-multisig \
		monero-wallet-cli \
		monero-wallet-rpc
	do
		install -D -m755 "$srcdir/$_gitname/build/bin/$b" "$pkgdir/usr/bin/$b"
	done

	install -Dm644 $srcdir/$_gitname/utils/systemd/monerod.service "${pkgdir}/usr/lib/systemd/system/monerod.service"
	install -Dm644 "$srcdir/$_gitname/utils/conf/monerod.conf" "$pkgdir/etc/monerod.conf"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libmonero-wallet-git() {

	provides=("libmonero-wallet=$pkgver")
	conflicts=('libmonero-wallet')

        # NOTE: this is crucial, otherwise stripping breaks the .a archive:
        # monero-core (GUI) fails to link against it (it can't find symbols
        # that are clearly in the library).
        options=(!strip)

        cd $srcdir/$_gitname/$_builddir
        _stagedir=stagedir
        mkdir -p $_stagedir
        make DESTDIR=$_stagedir install

        cd $_stagedir
        find usr/{include,lib} -type f -exec install -D -m 755 {} ${pkgdir}/{} \;
}
sha256sums=('SKIP'
            'fe716415b67138cf79357c7db8d684d57f9dae4180e755b8143ff5bc7ce47bfc')
