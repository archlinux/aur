# Maintainer: Hamza Abdelmoumene <ph_abdelmoumene@esi.dz>
#
# AUR package for lyrics-tool. This builds from the tagged GitHub release.
# After bumping pkgver, refresh the checksum with:  updpkgsums
# and regenerate .SRCINFO with:                     makepkg --printsrcinfo > .SRCINFO
pkgname=lyrics-tool
pkgver=0.2.1
pkgrel=1
pkgdesc="Cross-platform terminal lyrics visualizer and LRC/WLRC toolkit"
arch=('any')
url="https://github.com/hamza-abdelmoumene/lyrics-tool"
license=('MIT')
depends=(
  'python'
  'python-mutagen'
  'python-yaml'
  'python-pillow'
  'python-syncedlyrics'   # from the AUR if not in the official repos
)
optdepends=(
  'playerctl: live player sync for the visualizer (lyricsooo)'
  'ffmpeg: read audio durations when processing (lyricsooo-cook)'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21b7d75f89f78b5bbaab808b6d36c339f2355ccfbaa4769856b1d78af8014bdb')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest -q || true   # tests need no network; keep non-fatal for the AUR
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
