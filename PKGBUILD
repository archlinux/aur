# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
#
# The AUR package: builds the latest commit on main. The recipe itself lives in
# this repo; publishing is copying this file and its .SRCINFO into the AUR repo
# (`make aur` regenerates .SRCINFO).

pkgname=steno-git
_pkgname=steno
pkgver=0.11.0.r0.g52f998c
pkgrel=1
pkgdesc="Listens to your meetings and turns them into notes and todos"
arch=('any')
url="https://github.com/jaehho/steno"
license=('MIT')
# Same runtime as packaging/PKGBUILD; keep the two lists in step.
depends=(
  'python'
  'python-gobject'
  'glib2'
  'pango'
  'gtk4'
  'libadwaita>=1:1.6'
  'libdbusmenu-glib'
  'hicolor-icon-theme'
  'python-websockets'
  'python-httpx'
  'python-dotenv'
  'libpulse'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
)
optdepends=(
  'claude-code: summaries and questions (or its native install on PATH)'
  'libnotify: desktop notifications when a summary is ready'
  'python-numpy: `steno clean-echo`, for meetings recorded on speakers'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
install=steno.install
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # v0.10-3-gabc1234 -> 0.10.r3.gabc1234 once there are tags; r<count>.<hash> until then.
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  # Headless by construction: no audio device, no network, no display.
  PYTHONPATH=src python -m unittest discover -s tests -t .
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 packaging/dev.jaeho.Steno.desktop \
    "$pkgdir/usr/share/applications/dev.jaeho.Steno.desktop"
  install -Dm644 src/steno/data/icons/hicolor/scalable/apps/dev.jaeho.Steno.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.jaeho.Steno.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
