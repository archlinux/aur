# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=vpkedit
pkgname=(vpkedit libvpkeditc)
pkgver=4.1.0
pkgrel=3
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'gcc' 'qt6-tools')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
		"argparse::git+https://github.com/p-ranav/argparse.git"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git"
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git"
		"minizip-ng::git+https://github.com/zlib-ng/minizip-ng.git"
		"sourcepp::git+https://github.com/craftablescience/sourcepp.git"
		"miniaudio::git+https://github.com/mackron/miniaudio.git"
		"libvpkeditc.patch::https://github.com/craftablescience/VPKEdit/commit/4ae22388250f76e68006564c31a6a5fcd49b6c69.patch"
		"libvpkeditc2.patch::https://github.com/craftablescience/VPKEdit/commit/55e2d756b68d02cd93afcfc3abc02ebe39036b7b.patch"
		"libvpkeditc3.patch::https://github.com/craftablescience/VPKEdit/commit/b831bd32dc9dcf3a48aa8c5924796d473c7457ea.patch"
		#Submodule for submodules
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9f59b6aa4e561e4ab60818ec7bfab4d968ce33e4f88d2e3abe5e3d20e2d73a20'
            '61bbc9ccb191fe0c117f97a519b216b7060f805ceb284e8e0583f74e0daeb618'
            '69fb93ace18cf2e1339430e6135b445964656793fee47e15bbff0e36c5185ff8'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 <"$srcdir/libvpkeditc.patch"
	patch -p1 <"$srcdir/libvpkeditc2.patch"
	patch -p1 <"$srcdir/libvpkeditc3.patch"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv,sourcepp,miniaudio}; do
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
