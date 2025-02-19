# Maintainer: Cody Schafer <aur at codyps com>
# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=rr
pkgver=5.9.0
pkgrel=1
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64 aarch64)
url='http://rr-project.org/'
license=('custom')
depends=('gdb' 'capnproto' 'gcc-libs' 'glibc' 'perf' 'zlib')
optdepends=(
  'python: for rr-collect-symbols.py'
  'bash: for signal-rr-recording.sh'
)
makedepends=('git' 'cmake' 'ninja' 'patch' 'pkg-config')
options=(!strip)

source=(
	$pkgname-$pkgver.tar.gz::https://github.com/rr-debugger/${pkgname}/archive/${pkgver}.tar.gz
)
sha1sums=('3875953ac5cfff02c029b2c10a4d8addd39d20e1')

build() {
	cmake \
		-GNinja \
		-Ddisable32bit=true \
		-DCMAKE_BUILD_TYPE=plain \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DBUILD_TESTS=OFF \
		-DWILL_RUN_TESTS=OFF \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_STANDARD=17 \
		-Wno-dev \
		-B build \
		-S "$pkgname-$pkgver"

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --build build -- -v install
	if check_option 'debug' n; then
		find "${pkgdir}/usr/bin" -type f -executable -exec strip $STRIP_BINARIES {} + || :
	fi
	install -D "$pkgname-$pkgver"/LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
	install -D "$pkgname-$pkgver"/scripts/zen_workaround.service "${pkgdir}/usr/lib/systemd/system/zen_workaround.service"
	install -D "$pkgname-$pkgver"/scripts/zen_workaround.py "${pkgdir}/usr/share/zen_workaround/zen_workaround.py"
}
