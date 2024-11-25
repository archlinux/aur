_name=xorgproto
pkgname=mingw-w64-$_name
pkgver=2024.1
pkgrel=1
pkgdesc="combined X.Org X11 Protocol headers (mingw-w64)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('mingw-w64-xorg-util-macros' 'mingw-w64-meson')
provides=('mingw-w64-xproto')
conflicts=('mingw-w64-xproto')
replaces=('mingw-w64-xproto')
options=('staticlibs' '!buildflags' '!strip')
source=(https://xorg.freedesktop.org/archive/individual/proto/$_name-$pkgver.tar.gz{,.sig}
	meson.patch)
sha512sums=('c2d67a98c5ba9b2f4d0b844c96dab342c497710753a8878b75dbf12ecd64b105c9ee3c5fd11eb91e45960420cf8dd7d02547072a32d5c53e58e009394fe33666'
            'SKIP'
            'cec486d47dbea1fcb4338a849b71b69756a8c5bdd4dde16dd8ae963f70bf5231fee227970016a3ab9924934644e7c9c0ccba85c5d9c12caf0be124c3d2ffb645')
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/$_name-$pkgver"
	patch -p1 -i "$srcdir/meson.patch"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch}
		${_arch}-meson build-${_arch} \
			-Dlegacy=true

		ninja -C build-${_arch}
	done
}

package() {
	cd "$srcdir/$_name-$pkgver"
	for _arch in ${_architectures}; do
		DESTDIR="$pkgdir" ninja -C build-${_arch} install
	done
}
