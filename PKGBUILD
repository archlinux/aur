# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libpsl
_pkgname=libpsl
pkgver=0.21.5
pkgrel=2
pkgdesc='Public Suffix List library (mingw-w64)'
url='https://github.com/rockdaboot/libpsl'
arch=(any)
license=('MIT')
depends=('mingw-w64-libidn2' 'mingw-w64-libunistring')
makedepends=('mingw-w64-meson' 'gtk-doc')
source=(https://github.com/rockdaboot/libpsl/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('c14d575cecc0f1693894dd79565b6b9220084ddfa43b908a1cefe16d147cdd5ec47796eb0c2135e2f829a951abaf39d8a371ab5c1352f57b36e610e25adf91f5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p "build-${_arch}" && pushd build-${_arch}
		${_arch}-meson \
			-D strip=true \
			-D docs=false \
			-D runtime=libidn2 .. \
			--default-library=both
		ninja
		popd
	done
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" ninja -C "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}" install
		if [[ $NO_EXECUTABLES ]]; then
			find "$pkgdir/usr/${_arch}" -name '*.exe' -delete
		fi
	done
}
# vim: set sw=2 ts=2 et:
