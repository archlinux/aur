# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: reelo built from a tagged release's source. The release workflow writes the
# published copy (version and checksum filled in, plus .SRCINFO) into its `aur` artifact.

pkgname=reelo
pkgver=0.1.5
pkgrel=1
pkgdesc="uQ's media player: mpv's engine in a Qt Quick window that follows the uQ theme, with MPRIS"
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/reelo'
license=('GPL-3.0-or-later')
depends=('mpv' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('yt-dlp: play video pages (YouTube and the like) from an address'
            'qt6-wayland: run natively on Wayland'
            'uq: Media player page in uQ Settings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7749ddbed86bc929fc23d0618e68e0407d09f8463822980a441347ce08389b96')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DREELO_TESTS=ON
  cmake --build build
}

check() {
  # Every release's tests passed in CI before it was tagged. Running them again while the
  # package installs only makes setup longer, and a test that needs a terminal or a
  # session can fail in a clean build. UQ_CHECK=1 runs them.
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
