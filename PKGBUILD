# Maintainer: sitiyou <sitiyou7@gmail.com>
# Contributor: sitiyou <sitiyou7@gmail.com>

pkgname=layrics-git
_pkgname=layrics
pkgver=r126.304b1d3
pkgrel=1
pkgdesc="Desktop lyrics overlay for Wayland — auto-synced with MPRIS players, with ASS and shader karaoke via asslayer"
arch=('x86_64')
url="https://github.com/sitiyou/layrics"
license=('GPL-3.0-only')
depends=(
  'python-asslayer>=0.2.0'
  'python-asslayer<0.3.0'
  'python-httpx'
  'python-brotli'
  'python-h2'
  'python-dbus'
  'python-gobject'
  'python-click'
  'python-diskcache'
  'python-pyaes'
  'python-appdirs'
  'python-kara-templater>=1.2.2'
  'python-kara-templater<2'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
)
provides=('layrics')
conflicts=('layrics')
source=("$_pkgname::git+https://github.com/sitiyou/layrics.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 layrics.desktop "$pkgdir/usr/share/applications/layrics.desktop"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/layrics.png"
}
