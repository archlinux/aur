# Maintainer: Gianluca Mazza <info@gianlucamazza.it>

pkgname=nstream
# Keep pkgver in sync with __version__ in src/nstream/__init__.py
# (build-local.sh asserts they match; .SRCINFO follows).
pkgver=1.43.0
pkgrel=1
pkgdesc="Native, terminal-first Stremio-like client (Cinemeta + Torrentio/debrid or local P2P + mpv)"
arch=('any')
url="https://github.com/gianlucamazza/nstream"
license=('MIT')
depends=('python' 'mpv' 'fzf' 'ffmpeg')  # ffmpeg → ffprobe for the pre-play track menu
optdepends=(
  'foot: terminal used by the desktop launcher'
  'catt: cast to a Chromecast with --cast (install via pipx; not in the repos)'
  'chafa: poster thumbnails in the fzf preview pane'
  'torrserver-bin: local P2P playback without a debrid provider (AUR)'
  'libva-utils: GPU decode detection (vainfo) for hardware-aware stream ranking'
)
# The castbridge metadata sender and the --mirror realtime sender are separate
# openscreen-fork builds (CASTBRIDGE_BIN / CAST_MIRROR_BIN), not packaged; nstream
# falls back to catt / the DMR path without them.
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
install="$pkgname.install"
# GitHub auto-generated source tarball (directory inside: nstream-$pkgver).
source=("$pkgname-$pkgver.tar.gz::https://github.com/gianlucamazza/nstream/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc665790be81593f2c9f58e764cbc91edf719a453281eb358e3a9ed49da9d576')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # Runtime is stdlib-only, so the source tree on PYTHONPATH is enough to run the
  # suite without installing first.
  PYTHONPATH="$PWD/src" python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 nstream-fuzzel "$pkgdir/usr/bin/nstream-fuzzel"
  install -Dm644 nstream.desktop "$pkgdir/usr/share/applications/nstream.desktop"
  install -Dm644 config.example.json "$pkgdir/usr/share/nstream/config.example.json"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
