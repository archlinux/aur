# Maintainer: Cody Schafer <aur at codyps com>
# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr-multilib
pkgver=5.6.0
pkgrel=1
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('gdb' 'capnproto' 'lib32-gcc-libs')
makedepends=('git' 'cmake' 'gdb' 'ninja')
options=(!strip)
conflicts=(rr)
provides=(rr)

source=(
	rr-$pkgver.tar.gz::https://github.com/rr-debugger/rr/archive/${pkgver}.tar.gz
)
sha1sums=('9a047cbd1c47ef1585293ba090c5cd2d56519fa6')

prepare() {
	cd rr-$pkgver
	mkdir -p build
}

build() {
	cd rr-$pkgver/build
	cmake \
		-GNinja \
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
	cd rr-$pkgver/build
	DESTDIR="${pkgdir}" cmake --build . -- -v install
	if check_option 'debug' n; then
		find "${pkgdir}/usr/bin" -type f -executable -exec strip $STRIP_BINARIES {} + || :
	fi
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
