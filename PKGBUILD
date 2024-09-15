# Maintainer: Self Denial <selfdenial@pm.me>
# Used https://gitlab.archlinux.org/archlinux/packaging/packages/libkiwix as inspiration

pkgname=libkiwix-git
_pkgname="${pkgname%-git}"
pkgver=13.1.0.r120.g327fec18
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('x86_64')
provides=('kiwix-lib')
conflicts=('kiwix-lib')
replaces=('kiwix-lib')
depends=('libzim>=9.0.0' 'pugixml' 'xapian-core' 'aria2' 'libmicrohttpd' 'python' 'curl')
makedepends=('meson' 'gtest' 'mustache')
url='https://github.com/kiwix/libkiwix'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() { 
        cd "$srcdir/${_pkgname}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir/${_pkgname}"
	# We want to ignore xapian ABI version mismatches
	# https://github.com/openzim/libzim/issues/757
	arch-meson build -Dwerror=false -Dcpp_std=c++17
	ninja -C build
}

check() {
        cd "$srcdir/${_pkgname}/build"
	meson test
}

package() {
	install -Dm644 "$srcdir/${_pkgname}/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
        cd "$srcdir/${_pkgname}/build"
	DESTDIR="$pkgdir" ninja install
}

