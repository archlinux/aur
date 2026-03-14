# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=m33mu-git
_pkgname=${pkgname%-git}
pkgver=r138.0ad1f71
pkgrel=1
pkgdesc="A Cortex-M33 emulator with TrustZone awareness"
arch=(x86_64)
url="https://github.com/danielinux/m33mu"
license=('AGPL-3.0-or-later')
depends=(capstone libtpms wolfssl-all vde2 ncurses libelf)
makedepends=(git cmake)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("m33mu::git+https://github.com/danielinux/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
	cd "$srcdir/${_pkgname}"
    ctest --test-dir build
}

package() {
	cd "$srcdir/${_pkgname}"
	DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
