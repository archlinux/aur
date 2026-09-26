# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# melody-watch on its own: run where the music is -- a NAS that cannot run
# the engine -- it tells an engine elsewhere which files changed, so that
# engine re-reads just those instead of scanning over the network. It needs
# the protocol client only, so it builds in seconds without the engine.
pkgname=melody-watch-git
pkgver=r462.gd3c7d32
pkgrel=1
pkgdesc='Tells a Melody engine which music files changed on a NAS, so it need not scan'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
depends=(gcc-libs glibc libutf8proc)
makedepends=(cmake git ninja nlohmann-json)
provides=(melody-watch)
conflicts=(melody-watch)
install=melody-watch.install
source=("melody-next::git+https://github.com/carnager/melody-next.git")
sha256sums=('SKIP')

pkgver() {
  cd melody-next
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody-next
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DTRACKKNIFE_CLI_ONLY=ON -DTRACKKNIFE_BUILD_UI=OFF -DBUILD_TESTING=OFF \
    -DTRACKKNIFE_BUILD_BENCHMARKS=OFF -DTRACKKNIFE_WARNINGS_AS_ERRORS=OFF
  cmake --build build --target melody_watch
}

package() {
  cd melody-next
  DESTDIR="$pkgdir" cmake --install build --component watch
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
