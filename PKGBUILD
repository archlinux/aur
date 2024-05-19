# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=vpkedit
pkgname=(vpkedit libvpkeditc)
pkgver=4.2.0
pkgrel=2
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
		"discord::git+https://github.com/craftablescience/discord-rpc-clean.git"
		"indicators::git+https://github.com/p-ranav/indicators.git"
		"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git"
		#Submodule for submodules
		"bufferstream::git+https://github.com/craftablescience/BufferStream.git")
sha256sums=('8fe01e454f04129381d36c2d6104fb97a51bcffdca6031d752236e28769de5d6'
            'SKIP'
            'SKIP'
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
	git submodule init
	for submodule in {vtflib,saap,speedykeyv,sourcepp,miniaudio,discord}; do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git config submodule.src/cli/thirdparty/argparse.url "$srcdir/argparse"
	git config submodule.src/cli/thirdparty/indicators.url "$srcdir/indicators"
	git config submodule.src/lib/thirdparty/minizip-ng.url "$srcdir/minizip-ng"
	git config submodule.src/lib/thirdparty/cryptopp.url "$srcdir/cryptopp"
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
	-DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DVPKEDIT_BUILD_LIBC=ON

	cmake --build build
}

package_vpkedit() {
	optdepends=('qt6-wayland: Wayland support')
	depends+=('qt6-base' 'hicolor-icon-theme')

	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system, and propperly symlink
	cd "$pkgdir/usr/lib/$pkgname"
	rm -rf libQt*
	ln -sf "/usr/lib/$pkgname/vpkedit" "$pkgdir/usr/bin/vpkedit"
	ln -sf "/usr/lib/$pkgname/vpkeditcli" "$pkgdir/usr/bin/vpkeditcli"

	# Change desktop file to point towards /usr/lib/vpkedit
	cd "$pkgdir/usr/share/applications"
	sed -i 's/Exec=\/opt\/vpkedit\//Exec=/g' vpkedit.desktop



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
