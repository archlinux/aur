# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=lokinet
pkgver=0.9.11
pkgrel=1
pkgdesc="Anonymous, decentralized and IP based overlay network for the internet."
arch=('x86_64' 'aarch64')
url="https://lokinet.org"
license=('GPL3')
depends=('libuv' 'libsodium' 'curl' 'zeromq' 'unbound' 'jemalloc' 'systemd-libs' 'spdlog' 'fmt')
makedepends=('cmake' 'git' 'python' 'systemd' 'nlohmann-json')
install='lokinet.install'
source=("https://github.com/oxen-io/lokinet/releases/download/v$pkgver/lokinet-v$pkgver.tar.xz"{,.sig}
        'lokinet.conf'
        'lokinet.service'
        'lokinet-vpn@.service'
        'lokinet-resume.service'
        'lokinet.sysusers'
        'lokinet.tmpfiles'
        'lokinet.rules')
sha256sums=('c16c82c7528beae5ceca072eaf6e1a9eb4b85247f1d60352344b5ee53009391c'
            'SKIP'
            'ff5e7db4e65463e50978da0185487bd4a7f213f04bdb6256e221089f833c6ab6'
            'ffd87df5d7a6d8b7416577a87e89f79c54930e0f14824c9831ad16f0ecfb6f42'
            '1c90e7e362bf33d824af70fcf7da509dcc166f9d1f9c90111d25c28905b81857'
            'bcf4bd7b38d2f054e25cc243353d3c9a56d1948b42ad07ee5c0260de06e8dd6c'
            '137cf7eeebc8737d62f3ccfad2398fb1c442a91cb9db7d650429b218dd949a00'
            'b0d87fd610bbc7ef56148590dbc6ed6a68f36ec88db783f408a66c815705fd75'
            '6ea4d917ce2e46b2c31af31b8c8c28054c5f977bab5b050c44e2029ab3248713')
validpgpkeys=('2CE6F2743138825B7A7E521D025C02EE3A092F2D') # Jeff Becker (probably not evil) <jeff@lokinet.io> https://lokinet.io/jeff.asc

build() {
	cd "lokinet-v$pkgver"

	rm -rf build && mkdir build && cd build

	# XXX cmake stuff overrides CFLAGS
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_FLAGS="$CFLAGS" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DNATIVE_BUILD=OFF \
		-DUSE_AVX2=OFF \
		-DWITH_TESTS=OFF \
		-DDOWNLOAD_SODIUM=OFF \
		-DSUBMODULE_CHECK=OFF \
		-DWITH_SYSTEMD=ON \
		-DWITH_SETCAP=OFF \
		-DBUILD_LIBLOKINET=OFF \
		-DFORCE_OXENMQ_SUBMODULE=ON \
		-DFORCE_OXENC_SUBMODULE=ON \
		-DWITH_PEERSTATS_BACKEND=OFF \
		-Wno-dev \
		..
	make
}

package() {
	cd "lokinet-v$pkgver"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd build
	make DESTDIR="$pkgdir" install

	install -D -m 644 "$srcdir/lokinet.service"                "$pkgdir/usr/lib/systemd/system/lokinet.service"
	install -D -m 644 "$srcdir/lokinet-vpn@.service"           "$pkgdir/usr/lib/systemd/system/lokinet-vpn@.service"
	install -D -m 644 "$srcdir/lokinet-resume.service"         "$pkgdir/usr/lib/systemd/system/lokinet-resume.service"
	install -D -m 644 "$srcdir/lokinet.sysusers"               "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
	install -D -m 644 "$srcdir/lokinet.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"
	install -D -m 750 -d "$pkgdir/usr/share/polkit-1/rules.d"
	install -D -m 644 "$srcdir/lokinet.rules"                  "$pkgdir/usr/share/polkit-1/rules.d/lokinet.rules"
	install -D -m 750 -d "$pkgdir/etc/loki"
}
