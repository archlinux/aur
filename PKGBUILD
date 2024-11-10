# Maintainer: haagch <christoph.haag@collabora.com>
pkgname=perfetto
pkgver=48.1
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
source=("https://github.com/google/perfetto/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d3738557cb56bfaea7c00a6609c94566e346185612237143ea76e9c1f1d9dee12006537c84e87ab93e6f3af7b9793d819ca4fb582fc7309841c026031271860a')

build() {

    cd perfetto-$pkgver
	tools/install-build-deps
	tools/gn gen --args='is_debug=false' out/linux
	tools/ninja -C out/linux tracebox traced traced_probes perfetto
	tools/gen_amalgamated --output sdk/perfetto
}

package() {
    cd perfetto-$pkgver

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
