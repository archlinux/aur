_pkgname=resvg
pkgname=${_pkgname}-git
pkgver=0.4.0.r6.g9891e06
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_pkgname"
license=(MPL2)
makedepends=(cargo qt5-base pango)
conflicts=(resvg)
provides=(resvg)
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	for dir in capi tools/rendersvg; do
	(
		msg2 "Building $dir"
		cd "$dir"
		cargo build --release --features='qt-backend cairo-backend'
	)
	done
	
	msg2 'Building docs'
	cargo doc --release
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	install -Dm755 target/release/rendersvg   "$pkgdir/usr/bin/rendersvg"
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 capi/include/resvg.h       "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
