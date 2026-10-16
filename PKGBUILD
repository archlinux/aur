# Maintainer: Cody Schafer <aur at codyps com>
# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=rr-multilib
pkgver=5.10.0
pkgrel=1
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('gdb' 'capnproto' 'gcc-libs' 'glibc' 'perf' 'zlib' 'lib32-gcc-libs')
optdepends=(
  'python: for rr-collect-symbols.py'
  'bash: for signal-rr-recording.sh'
)
makedepends=('git' 'cmake' 'ninja' 'patch' 'pkg-config')
options=(!strip)
conflicts=(rr)
provides=("rr=$pkgver")

source=(
	rr-$pkgver.tar.gz::https://github.com/rr-debugger/rr/archive/${pkgver}.tar.gz
)
sha256sums=('af6677b51bcb034f60b47177a5ed9290605360e6a4a7d7e11365702c4f8cd296')

build() {
	cmake \
		-GNinja \
		-DCMAKE_BUILD_TYPE=plain \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DBUILD_TESTS=OFF \
		-DWILL_RUN_TESTS=OFF \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_STANDARD=17 \
		-Wno-dev \
		-B build \
		-S "rr-$pkgver"

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --build build -- -v install
	if check_option 'debug' n; then
		find "${pkgdir}/usr/bin" -type f -executable -exec strip $STRIP_BINARIES {} + || :
	fi
	install -D "rr-$pkgver"/LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
	install -D "rr-$pkgver"/scripts/zen_workaround.service "${pkgdir}/usr/lib/systemd/system/zen_workaround.service"
	install -D "rr-$pkgver"/scripts/zen_workaround.py "${pkgdir}/usr/share/zen_workaround/zen_workaround.py"
}
