# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=vpkedit
pkgname=(vpkedit libvpkeditc)
pkgver=4.1.3
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'gcc' 'qt6-tools')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
		1.patch::$url/commit/4a50dcfc695ef083ba55224ca84f28b394d2552f.patch
		2.patch::$url/commit/8dd7d14478a0a1300467e2d23a224293a9f50e21.patch
		"argparse::git+https://github.com/p-ranav/argparse.git"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git"
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
		"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git"
		"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
		"miniaudio::git+https://github.com/mackron/miniaudio.git"
		"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
		#Submodule for submodules
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git")
sha256sums=('107d3a56d30930cf104b6e928f791419442dc978710f99f1b2cd5d72e7088ab5'
            '6e0831e1dd853d8b1d80ad8aaf7a019f8af829651b98a09ae29db227d4fc79dd'
            '60b0c605ea680a6b60f14b6f656af2248e9d015227ba2cbbcc76db7235db9dee'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 < "$srcdir/1.patch"
	patch -p1 < "$srcdir/2.patch"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv,sourcepp,miniaudio,discord}; do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/lib/thirdparty/minizip-ng.url "$srcdir/minizip-ng"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/src/gui/thirdparty/sourcepp"
	git submodule init
	git config submodule.src/thirdparty/bufferstream.url "$srcdir/bufferstream"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/opt/vpkedit \
	-DCMAKE_BUILD_TYPE=Release \
	-DVPKEDIT_BUILD_LIBC=ON

	cmake --build build
}

package_vpkedit() {
	optdepends=('qt6-wayland: Wayland support')
	depends+=('qt6-base' 'hicolor-icon-theme')

	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system
	cd "$pkgdir/opt/vpkedit"
	rm -rf libQt*

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libvpkeditc() {
	cd "$srcdir/build"
	install -Dm755 libvpkeditc.so "$pkgdir/usr/lib/libvpkeditc.so"
	install -Dm644 "$srcdir/vpkedit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir/vpkedit"
	mkdir -p "$pkgdir/usr/include/" && cp -r include/vpkeditc "$pkgdir/usr/include/vpkeditc"
	chmod 755 "$pkgdir/usr/include/vpkeditc"

}
