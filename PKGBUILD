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
source=(v8.pc d8)
sha512sums=('f637ce092b4f32dc8bb0cb925b6bce4490e26e0a290a994479b02670bf6290d264e53c4ab576aa0381999f0f887ae43137bfec14ab9e40164d367c313c858fcf'
            '5aa6fea4a6d2f84bdba2032dcc00a79e3169c49066cc055a5106f858834db38dec3257f7a435aa518eb57eb4dfe4a3e092e2486c522362d49a61dfd92fba5717')

OUTDIR=out/Default/

export PATH=/opt/depot_tools:$PATH

prepare() {
	cd "$srcdir/"

	# Fill pkg-config fields
	sed -i -e "s|@VERSION@|$pkgver|g" -e "s|@DESCRIPTION@|$pkgdesc|g" -e "s|@URL@|$url|g" v8.pc

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

	# TODO: Use v8gen.py?
	gn gen $OUTDIR --script-executable=python2 --fail-on-unused-args --args="v8_monolithic=true is_component_build=false v8_use_external_startup_data=false use_custom_libcxx=false use_sysroot=false"

	# Create missing directories
	mkdir -p $OUTDIR/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/ \
	         $OUTDIR/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/
}

build() {
	cd "$srcdir/$pkgname/"
	# TODO: Use autoninja?
	# Based on BUILD_TARGETS_TEST in tools/dev/gm.py
	ninja -C $OUTDIR v8_monolith d8 cctest inspector-test unittests wasm_api_tests
}

check() {
	cd "$srcdir/$pkgname/"
	# Based on DEFAULT_TESTS in tools/dev/gm.py
	python2 tools/run-tests.py --outdir=$OUTDIR cctest debugger intl message mjsunit unittests
}

package() {
	cd "$srcdir/$pkgname/"

	# Install libraries
	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/" "$OUTDIR/d8" \
	                                              "$OUTDIR/obj/libv8_monolith.a"

	# Install executable wrapper
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/d8"

	# Install headers
	install -Dm644 -t "$pkgdir/usr/include/v8/" include/*.h
	for dir in include/*/; do
		install -Dm644 -t "$pkgdir/usr/include/v8/${dir##include/}" "$dir"/*.h
	done
	ln -s "$pkgdir/usr/include/v8/" "$pkgdir/usr/include/v8/include"

	# Install pkg-config
	install -Dm644 -t "$pkgdir/usr/lib/pkgconfig/" "$srcdir/v8.pc"

	# Install licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*
}
