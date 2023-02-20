# Maintainer: Cody Schafer <aur at codyps com>
# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=5.6.0
pkgrel=2
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('gdb' 'capnproto')
makedepends=('git' 'cmake' 'gdb' 'ninja')
options=(!strip)

source=(
	$pkgname-$pkgver.tar.gz::https://github.com/rr-debugger/${pkgname}/archive/${pkgver}.tar.gz
	https://github.com/rr-debugger/rr/commit/2979c60ef8bbf7c940afd90172ddc5d8863f766e.patch
)
sha1sums=('9a047cbd1c47ef1585293ba090c5cd2d56519fa6'
          '7faf899f31ee8e9e47a6ab8dce261cf64b235c6c')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build
	patch -p1 -N -i ../2979c60ef8bbf7c940afd90172ddc5d8863f766e.patch
}

build() {
	cd $pkgname-$pkgver/build
	cmake \
		-GNinja \
		-Ddisable32bit=true \
		-DCMAKE_BUILD_TYPE=plain \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DBUILD_TESTS=OFF \
		-DWILL_RUN_TESTS=OFF \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_STANDARD=14 \
		..

	cmake --build .	 -- -v
}

package() {
	cd $pkgname-$pkgver/build
	DESTDIR="${pkgdir}" cmake --build . -- -v install
	if check_option 'debug' n; then
		find "${pkgdir}/usr/bin" -type f -executable -exec strip $STRIP_BINARIES {} + || :
	fi
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
