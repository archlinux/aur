# Maintainer: sitiyou <sitiyou7@gmail.com>
# Contributor: sitiyou <sitiyou7@gmail.com>

pkgname=layrics-git
_pkgname=layrics
pkgver=r100.7f83b10
pkgrel=1
pkgdesc="Desktop lyrics overlay for Wayland — auto-synced with MPRIS players, rendered via libass on wlr-layer-shell"
arch=('x86_64')
url="https://github.com/sitiyou/layrics"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-httpx'
  'python-brotli'
  'python-h2'
  'python-dbus'
  'python-gobject'
  'python-click'
  'python-diskcache'
  'python-pyaes'
  'python-appdirs'
  'wayland'
  'vulkan-driver'
  'vulkan-icd-loader'
  'libass'
  'fontconfig'
)
makedepends=(
  'git'
  'meson'
  'python-build'
  'python-installer'
  'python-wheel'
  'meson-python'
  'pybind11'
  'vulkan-headers'
  'shaderc'
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
  python -m build --wheel --no-isolation -Cbuild-dir=build
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 layrics.desktop "$pkgdir/usr/share/applications/layrics.desktop"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/layrics.png"
}
