# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Marco Pompili <aur@mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>
pkgname=v8
pkgver=8.7.220.25
pkgrel=1
pkgdesc="Google's open source JavaScript engine"
arch=('x86_64' 'i686')
url="https://v8.dev/"
license=('BSD')
depends=(icu)
optdepends=('rlwrap: readline support')
makedepends=(depot-tools-git python2)
conflicts=(v8-3.14 v8-3.14-bin v8-6.7-static v8-6.8 v8-r v8-static-gyp v8-static-gyp-5.4)
# TODO: Dynamic library
options=(staticlibs)
source=("$pkgname.pc" d8)
sha512sums=('25b44dfc7b0525a6396990149478cfd8bfcddbe2cdd1af99263bd116b774206fcec920294515b036576721c4da89150610ea26e99987a640d73cb7211dfd4934'
            '5aa6fea4a6d2f84bdba2032dcc00a79e3169c49066cc055a5106f858834db38dec3257f7a435aa518eb57eb4dfe4a3e092e2486c522362d49a61dfd92fba5717')

case "$CARCH" in
	'x86_64') V8_ARCH='x64' ;;
	'i686') V8_ARCH='ia32' ;;
esac

OUTDIR="out/$V8_ARCH.release/"

# Add depot_tools and python2 to $PATH
TEMPDIR=$(mktemp -d)
ln -s $(which python2) "$TEMPDIR/python"
export PATH=/opt/depot_tools:$TEMPDIR:$PATH

prepare() {
	cd "$srcdir/"

	# Fill pkg-config fields
	# TODO: Infer from BUILD.gn
	case "$V8_ARCH" in
		'x64') cflags="-DV8_COMPRESS_POINTERS" ;;
		*) cflags="" ;;
	esac
	sed -e "s|@PKGNAME@|$pkgname|g" \
	    -e "s|@VERSION@|$pkgver|g" \
	    -e "s|@DESCRIPTION@|$pkgdesc|g" \
	    -e "s|@URL@|$url|g" \
	    -e "s|@CFLAGS@|$cflags|g" \
	    -i "$pkgname.pc"

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

	# TODO: Use v8gen.py
	gn gen "$OUTDIR" --fail-on-unused-args --args="$(cat <<- EOF
		v8_monolithic=true
		is_component_build=false
		v8_use_external_startup_data=false
		use_custom_libcxx=false
		use_sysroot=false
		EOF
	)"

	# Create missing directories
	mkdir -p "$OUTDIR/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/" \
	         "$OUTDIR/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
}

build() {
	cd "$srcdir/$pkgname/"
	autoninja -C "$OUTDIR" v8_monolith d8
}

check() {
	cd "$srcdir/$pkgname/"
	# Based on tools/dev/gm.py
	BUILD_TARGETS_TEST=(d8 cctest inspector-test unittests wasm_api_tests)
	DEFAULT_TESTS=(cctest debugger intl message mjsunit unittests)
	autoninja -C "$OUTDIR" "${BUILD_TARGETS_TEST[@]}"
	./tools/run-tests.py --outdir="$OUTDIR" "${DEFAULT_TESTS[@]}"
}

package() {
	cd "$srcdir/$pkgname/"

	# Install libraries
	install -Dm755 -t "$pkgdir/usr/lib/$pkgname/" "$OUTDIR/d8" \
	                                              "$OUTDIR/obj/libv8_monolith.a"

	# Install executable wrapper
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/d8"

	# Install headers
	install -Dm644 -t "$pkgdir/usr/include/$pkgname/" include/*.h
	for dir in include/*/; do
		install -Dm644 -t "$pkgdir/usr/include/$pkgname/${dir##include/}" "$dir"/*.h
	done
	ln -rs "$pkgdir/usr/include/$pkgname/" "$pkgdir/usr/include/$pkgname/include"

	# Install pkg-config
	install -Dm644 -t "$pkgdir/usr/lib/pkgconfig/" "$srcdir/$pkgname.pc"

	# Install licenses
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*
}
