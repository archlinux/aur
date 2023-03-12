# Maintainer: haagch <christoph.haag@collabora.com>
pkgname=perfetto-git
pkgver=android.security.13.0.0_r2.r6458.g07b15988f0
pkgrel=1
pkgdesc="System profiling, app tracing and trace analysis"
arch=(x86_64)
url="https://perfetto.dev/"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'python' 'clang')
provides=('perfetto')
conflicts=('perfetto')
options=()
source=("git+https://android.googlesource.com/platform/external/perfetto/")
md5sums=("SKIP")

pkgver() {
  cd "perfetto"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "perfetto"
}

build() {
	cd "perfetto"
	tools/install-build-deps
	tools/gn gen --args='is_debug=false' out/linux
	tools/ninja -C out/linux tracebox traced traced_probes perfetto
	tools/gen_amalgamated --output sdk/perfetto
}

check() {
	cd "perfetto"
	# make -k check
}

package() {
	cd "perfetto"
	#DESTDIR="$pkgdir/" ninja -C out/linux install
        #install -d -m755 "$pkgdir"/usr/lib/
	install -D -m644 out/linux/libperfetto.so "$pkgdir"/usr/lib/libperfetto.so
	for i in perfetto tracebox traced
	do
		install -D -m755 "out/linux/$i" "$pkgdir/usr/bin/$i"
	done

	install -d -D -m755 test/configs "$pkgdir"/usr/share/perfetto/configs
	install -D -m755 test/configs/* "$pkgdir"/usr/share/perfetto/configs

	install -d -D -m755 sdk "$pkgdir"/usr/share/perfetto/sdk
	install -D -m755 sdk/perfetto.* "$pkgdir"/usr/share/perfetto/sdk
}
