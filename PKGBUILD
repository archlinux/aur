# Maintainer: nekgem <nekgem@cock.li>
pkgname=lokinet
_gitname=loki-network
pkgver=0.7.1
pkgrel=1
pkgdesc="Anonymous, decentralized and IP based overlay network for the internet."
arch=('x86_64' 'aarch64')
url="https://lokinet.org"
license=('ZLIB')
depends=('libuv' 'libsodium' 'curl')
makedepends=('git' 'cmake')
install='lokinet.install'
source=("git+https://github.com/loki-project/$_gitname.git#tag=v$pkgver" # github archives don't embed submodules
        'lokinet.service'
        'lokinet-bootstrap.service'
        'lokinet-default-config.service'
        'lokinet.sysusers'
        'lokinet.tmpfiles')
sha256sums=('SKIP'
            'ce7f40f91c1de020466f82fb504e261e66774ef5f97a9d914dbe61236a1baf01'
            '21c9bc83f8466ab17fa927561d7f24f930f97c996a8aa0fbbbbb2b65cb97b342'
            '6ef779170b72856bbb8df40c34a808acffddd156684bdb66a55e71d50cf95841'
            '137cf7eeebc8737d62f3ccfad2398fb1c442a91cb9db7d650429b218dd949a00'
            '53837c9cfc90b93d55558045108a5d1d7a8b8a75a266af264d7f9101363d043f')

prepare() {
	# XXX maybe should include submodules as part of sources?
	git -C "$_gitname" submodule update --init --recursive
}

build() {
	cd "$_gitname"

	rm -rf build && mkdir build && cd build
	# XXX cmake stuff overrides CFLAGS
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_FLAGS="$CFLAGS" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DNATIVE_BUILD=OFF \
		-DSTATIC_LINK_RUNTIME=OFF \
		-DUSE_NETNS=OFF \
		-DUSE_AVX2=OFF \
		-DXSAN=OFF \
		-DWITH_SHARED=OFF \
		-DWITH_TESTS=OFF \
		-DDOWNLOAD_SODIUM=OFF \
		-Wno-dev \
		..
	make
}

package() {
	cd "$_gitname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd build
	make DESTDIR="$pkgdir" install

	install -D -m 644 "$srcdir/lokinet.service"                "$pkgdir/usr/lib/systemd/system/lokinet.service"
	install -D -m 644 "$srcdir/lokinet-bootstrap.service"      "$pkgdir/usr/lib/systemd/system/lokinet-bootstrap.service"
	install -D -m 644 "$srcdir/lokinet-default-config.service" "$pkgdir/usr/lib/systemd/system/lokinet-default-config.service"
	install -D -m 644 "$srcdir/lokinet.sysusers"               "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
	install -D -m 644 "$srcdir/lokinet.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"
}
