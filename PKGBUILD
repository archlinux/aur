# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
pkgname="hardened-malloc-git"
pkgver=512+5c8b686
pkgdesc="Hardened allocator designed for modern systems."
url="https://github.com/GrapheneOS/hardened_malloc"
license=("MIT")
makedepends=("git")
conflicts=("hardened_malloc")
provides=("hardened_malloc")
arch=("x86_64")
pkgrel=1
source=('git://github.com/GrapheneOS/hardened_malloc'
		'preload.sh')
sha256sums=('SKIP'
            'e6dbce7ac1d689fafbc94ffb17d8c4ae5271dd3580421828d35aac2c067b652d')

# compress the modules or not
_compress="y"

# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

pkgver() {
	cd "${srcdir}/hardened_malloc"	
	printf "%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/hardened_malloc"
	
	CFLAGS="" make
}

package() {
	cd "${srcdir}/hardened_malloc"
	
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/bin"
	
	install -D -m755 "libhardened_malloc.so" "$pkgdir/usr/lib"
	install -D -m755 "$srcdir/preload.sh" "$pkgdir/usr/bin/hardened-malloc-preload"
	install -D -m755 "calculate_waste.py" "$pkgdir/usr/bin/hardened-malloc-calculate-waste.py"
	
	msg "Done."
}
