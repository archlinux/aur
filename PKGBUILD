# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Marco Pompili <aur@mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>
pkgname=v8
pkgver=8.5.210.20
pkgrel=1
pkgdesc="Google's open source JavaScript engine"
arch=('i686' 'x86_64')
url="https://v8.dev/"
license=('BSD')
depends=(icu) # TODO: glibc?
optdepends=('rlwrap: readline support')
makedepends=(depot-tools-git python python2)
conflicts=(v8-3.14 v8-3.14-bin v8-6.7-static v8-6.8 v8-r v8-static-gyp v8-static-gyp-5.4)
source=("v8.pc" "d8")
sha512sums=('67e248d18fb31b3804289b7b43dc256227bac0166936b9a8b8781cd29b398cb83bf0bd345a3f8b903fff27438e3a356588a855b26214ab5e36ba541f1f56dbbf'
            'bb815f27ab15ba2a56f183d1a74e355dbade6acfe310318934c6ac54e5ad1d47f576d87ea04f9e42e1f5f2d0739a61e51a6817fe2b0c1112a4b54b9e7e396c24')

OUTDIR=out/Default/

export PATH=/opt/depot_tools:$PATH

prepare() {
	cd "$srcdir/"

	if [ ! -d "$pkgname/" ]; then
		fetch "$pkgname"
	fi

	cd "$pkgname/"
	git reset --hard

	if [ -f third_party/icu/BUILD.gn.orig ]; then
		./build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
	fi

	gclient sync -D -r "$pkgver"

	./build/linux/unbundle/replace_gn_files.py --system-libraries icu

	sed -i -e "s|@VERSION@|$pkgver|g" -e "s|@DESCRIPTION@|$pkgdesc|g" -e "s|@URL@|$url|g" "$srcdir/v8.pc"

	gn gen $OUTDIR --script-executable=python2 --fail-on-unused-args --args="is_component_build=true use_sysroot=false use_custom_libcxx=false"

	# Create missing directories
	mkdir -p $OUTDIR/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/
	         $OUTDIR/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/
}

build() {
	cd "$srcdir/$pkgname/"
	# TODO: Use autoninja?
	# Based on BUILD_TARGETS_TEST in tools/dev/gm.py
	ninja -C $OUTDIR d8 cctest inspector-test unittests wasm_api_tests
}

check() {
	cd "$srcdir/$pkgname/"
	# Based on DEFAULT_TESTS in tools/dev/gm.py
	python2 tools/run-tests.py --outdir=$OUTDIR cctest debugger intl message mjsunit unittests
}

package() {
	cd "$srcdir/$pkgname/"

	# libraries
	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/" "$OUTDIR/d8" \
	                                              "$OUTDIR/libv8.so" \
	                                              "$OUTDIR/libv8_libbase.so" \
	                                              "$OUTDIR/libv8_libplatform.so" \
	                                              "$OUTDIR/libchrome_zlib.so"
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$OUTDIR/snapshot_blob.bin"

	# executable
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/d8"

	# headers
	install -Dm644 -t "$pkgdir/usr/include/v8/" include/*.h
	for dir in include/*/; do
		install -Dm644 -t "$pkgdir/usr/include/v8/${dir##include/}" "$dir"/*.h
	done

	# pkgconfig
	install -Dm644 -t "$pkgdir/usr/lib/pkgconfig/" "$srcdir/v8.pc"

	# licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*
}
