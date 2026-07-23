# Maintainer: Hamza Abdelmoumene <ph_abdelmoumene@esi.dz>
#
# AUR -git package for lyrics-tool. Builds the tip of the main branch.
pkgname=lyrics-tool-git
_pkgname=lyrics-tool
pkgver=0.2.2
pkgrel=1
pkgdesc="Cross-platform terminal lyrics visualizer and LRC/WLRC toolkit (git)"
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
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('lyrics-tool')
conflicts=('lyrics-tool')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
