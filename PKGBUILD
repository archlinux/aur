# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libxslt
pkgname=mingw-w64-${_pkgname}
pkgver=1.1.43
pkgrel=1
pkgdesc="XML stylesheet transformation library (mingw-w64)"
arch=(any)
url="http://xmlsoft.org/XSLT/"
license=('MIT')
depends=(mingw-w64-libxml2 mingw-w64-libgcrypt)
makedepends=(mingw-w64-configure)
options=(!strip staticlibs !buildflags !emptydirs)
source=("https://gitlab.gnome.org/GNOME/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2"
        "0003-fix-concurrent-directory-creation.all.patch")
sha256sums=('4e574ba219df34495f2ee63ae27bf904afa477c40d9a2969a330cf87f48053b6'
            'fc23bd3c9e62a28cb1c020cebc83ca7532a5a7a21c2e4748b72d13ac7716a851')

_srcdir="${_pkgname}-v${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$_srcdir"
	patch -p1 -i "${srcdir}/0003-fix-concurrent-directory-creation.all.patch"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$_srcdir"
	for _arch in ${_architectures}; do
		mkdir -p "build-${_arch}" && pushd "build-${_arch}"
		${_arch}-configure --without-python
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/$_srcdir/build-${_arch}"
		make DESTDIR="$pkgdir" install
		rm -rf "$pkgdir/usr/${_arch}/share/doc"
		rm -rf "$pkgdir/usr/${_arch}/share/man"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}
