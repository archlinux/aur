# Maintainer: Maarten de Vries
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
#               Severen Redwood <severen@shrike.me>
#               Xantares (AUR user)

pkgname=mingw-w64-capnproto
pkgver=0.8.0
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system (mingw-w64)"
arch=('any')
url='https://capnproto.org/'
license=('MIT')
makedepends=(mingw-w64-configure capnproto)
depends=(mingw-w64-crt)
source=("https://capnproto.org/capnproto-c++-${pkgver}.tar.gz")
sha512sums=('a32dbe6556a95761a5edc55237bd5558cb0ec08127f2fef1712076d5be4cd63e165a5d83b522307336bd3afeed1241f2c1e507830e8f12ac5dec78703a85417f')

options=(!strip !buildflags staticlibs)

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

build() {
	env
	cd "$srcdir/capnproto-c++-$pkgver"
	for _arch in ${_architectures[@]}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure --with-external-capnp --disable-shared --enable-static --disable-reflection
		make
		popd
	done
}

package() {
	for _arch in ${_architectures[@]}; do
		cd "${srcdir}/capnproto-c++-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-debug "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

# vim:set ts=4 sw=4:
