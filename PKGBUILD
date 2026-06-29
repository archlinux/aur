# Maintainer: DBeidachazi
pkgname=pipewire-bluez5-lhdc-git
pkgver=1.7.0.r15616.gd43c42891bd6
pkgrel=1
pkgdesc="Out-of-tree PipeWire bluez5 SPA plugin build with LHDC v5 codec support"
arch=('x86_64')
url="https://github.com/DBeidachazi/pipewire"
license=('MIT')
depends=('pipewire' 'bluez-libs' 'dbus' 'glib2' 'libusb')
makedepends=('git' 'meson' 'ninja' 'sbc' 'libfdk-aac' 'libldac')
optdepends=('lhdc-v5-helper: qemu-based LHDC v5 encoder helper')
source=('git+https://github.com/DBeidachazi/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  printf '1.7.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=12 HEAD)"
}

build() {
  local meson_options=(
    --prefix=/usr
    --libdir=lib
    -Dexamples=disabled
    -Dtests=disabled
    -Dman=disabled
    -Ddocs=disabled
  )

  arch-meson pipewire build "${meson_options[@]}"
  ninja -C build \
    spa/plugins/bluez5/libspa-bluez5.so \
    spa/plugins/bluez5/libspa-codec-bluez5-lhdc.so
}

package() {
  install -Dm755 build/spa/plugins/bluez5/libspa-bluez5.so \
    "$pkgdir/usr/lib/spa-0.2-lhdc/bluez5/libspa-bluez5.so"
  install -Dm755 build/spa/plugins/bluez5/libspa-codec-bluez5-lhdc.so \
    "$pkgdir/usr/lib/spa-0.2-lhdc/bluez5/libspa-codec-bluez5-lhdc.so"

  install -Dm644 pipewire/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
