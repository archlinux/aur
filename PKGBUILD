# Maintainer: DBeidachazi
pkgname=pipewire-bluez5-lhdc-git
pkgver=1.7.0.r15692.g6972f21d6a96
pkgrel=1
epoch=1
pkgdesc="PipeWire bluez5 SPA plugin overlay with upstream LHDC v5 codec support"
arch=('x86_64')
url="https://gitlab.freedesktop.org/pipewire/pipewire"
license=('MIT')
depends=('pipewire-audio' 'liblhdcv5' 'bluez-libs' 'dbus' 'glib2' 'libusb')
makedepends=('git' 'meson' 'ninja' 'sbc' 'libfdk-aac' 'libldac')
provides=('pipewire-bluez5-lhdc')
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
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
    --buildtype=plain
    --wrap-mode=nodownload
    --auto-features=disabled
    -Dexamples=disabled
    -Dtests=disabled
    -Dman=disabled
    -Ddocs=disabled
    -Dsession-managers=[]
    -Dpipewire-alsa=disabled
    -Dpipewire-jack=disabled
    -Dsystemd-system-service=disabled
    -Dsystemd-user-service=disabled
    -Dflatpak=disabled
    -Dudev=disabled
    -Dalsa=disabled
    -Djack=disabled
    -Dbluez5=enabled
    -Dbluez5-codec-lhdc=enabled
    -Ddbus=enabled
    -Dlibusb=enabled
    -Dselinux=disabled
  )

  meson setup build pipewire "${meson_options[@]}"
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
