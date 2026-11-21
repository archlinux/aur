# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: uqbit built from a tagged release's source. The release workflow writes the
# published copy (version and checksum filled in, plus .SRCINFO) into its `aur` artifact.

pkgname=uqbit
pkgver=0.1.0
pkgrel=1
pkgdesc="uQ's torrent app: a Qt Quick front-end for qBittorrent-nox that follows the uQ theme"
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/uqbit'
license=('GPL-3.0-or-later')
# qbittorrent-enhanced-nox (AUR) provides qbittorrent-nox too, so either engine works.
depends=('qbittorrent-nox' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'glibc' 'gcc-libs'
         'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('qt6-wayland: run natively on Wayland'
            'uq: Torrents page in uQ Settings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('984bd7077e6ee597e257421767c9c025f9fce2a877638dc462dce1a150129a31')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DUQBIT_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
