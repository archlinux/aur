# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: napa3um <napa3um at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

pkgname=mingw-w64-sqlite
_amalgamationver=3490100
pkgver=3.49.1
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
groups=(mingw-w64)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=('!strip' '!buildflags' 'staticlibs')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
source=("https://www.sqlite.org/2025/sqlite-autoconf-${_amalgamationver}.tar.gz")
sha256sums=('106642d8ccb36c5f7323b64e4152e9b719f7c0215acf5bfeac3d5e7f97b59254')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_cflags=(
	-fexceptions
	-DSQLITE_USE_MALLOC_H=1
	-DSQLITE_USE_MSIZE=1
	-DSQLITE_DISABLE_DIRSYNC=1
	-fno-strict-aliasing
)

build() {
	CFLAGS+=" ${_cflags[*]}"

	cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}

		# remove '--target=...' from mingw's configure
		bash <(sed 's/--target[^ ]* //' $(command -v "${_arch}-configure")) \
			--fts3 \
			--fts4 \
			--fts5 \
			--rtree \
			--session \
			--out-implib \
			--disable-load-extension

		make
		popd
	done
}

package() {
	cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
	for _arch in ${_architectures}; do
		pushd build-${_arch}
		make DESTDIR="${pkgdir}" install
		rm -r "${pkgdir}/usr/${_arch}/share"
		mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		popd
	done
}
