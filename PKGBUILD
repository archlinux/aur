# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=3.5.0
pkgrel=1
pkgdesc="Multi-featured system monitor"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL-3.0-or-later')
depends=(
  'dmidecode'
  'gtk4'
  'hwdata'
  'iproute2'
  'libadwaita'
  'polkit'
  'procps-ng'
  'python-cairo'
  'python-gobject'
  'python-pillow'
  'python-sv-ttk'
  'util-linux'
)
makedepends=('meson')
checkdepends=(
  'appstream'
  # 'appstream-glib'  ## test commented out in data/meson.build
  'desktop-file-utils'
)
optdepends=(
  'amdgpu_top: for video engine load on GPU tab and per-process GPU usage, GPU memory columns on Processes tab'
  'raspberrypi-utils: for physical RAM size, GPU frequency and video memory information on Raspberry Pi devices'
  'xorg-xrandr: for more accurate screen resolution and refresh rate detection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f81f1b8f0a6b12a4e7179b7545d1f7a164923f480263d72091fecde3d7e90d4')

prepare() {
  cd "$pkgname-$pkgver"

  # Use metainfo instead of deprecated appdata directory
  sed -i "s/('datadir'), 'appdata')/('datadir'), 'metainfo')/g" data/meson.build
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  appstreamcli validate --no-net build/data/*.appdata.xml
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
