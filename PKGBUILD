# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=3.0.0
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
optdepends=(
  'amdgpu_top: for video engine load on GPU tab and per-process GPU usage, GPU memory columns on Processes tab'
  'raspberrypi-utils: for physical RAM size, GPU frequency and video memory information on Raspberry Pi devices'
  'xorg-xrandr: for more accurate screen resolution and refresh rate detection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03bbe26b50b62bbc55715ce10af7e426a80db0b1f3f36bb258f2be4f395a6ba0')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  appstreamcli validate --no-net \
    "build/data/io.github.hakandundar34coding.$pkgname.appdata.xml" || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # Fix permissions
  chmod 0755 "$pkgdir/usr/bin/$pkgname"
}
