# Maintainer: DBeidachazi
pkgname=pipewire-bluez5-lhdc-git
pkgver=1.7.0.r15692.g6972f21d6a96
pkgrel=2
epoch=1
pkgdesc="PipeWire bluez5 SPA plugin overlay with upstream LHDC v5 codec support"
arch=('x86_64')
url="https://gitlab.freedesktop.org/pipewire/pipewire"
license=('MIT')
depends=(
  'pipewire-audio' 'liblhdcv5' 'bluez-libs' 'dbus' 'glib2' 'glibc' 'gcc-libs' 'libusb'
  'sbc' 'libfdk-aac' 'libfreeaptx' 'libldac' 'opus' 'liblc3'
)
makedepends=('git' 'meson' 'ninja')
provides=('pipewire-bluez5-lhdc')
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

_bluez5_plugins=(
  libspa-bluez5.so
  libspa-codec-bluez5-sbc.so
  libspa-codec-bluez5-faststream.so
  libspa-codec-bluez5-hfp-cvsd.so
  libspa-codec-bluez5-hfp-msbc.so
  libspa-codec-bluez5-aac.so
  libspa-codec-bluez5-aptx.so
  libspa-codec-bluez5-ldac.so
  libspa-codec-bluez5-lhdc.so
  libspa-codec-bluez5-opus.so
  libspa-codec-bluez5-opus-g.so
  libspa-codec-bluez5-lc3.so
  libspa-codec-bluez5-hfp-lc3-swb.so
  libspa-codec-bluez5-hfp-lc3-a127.so
  libspa-codec-bluez5-g722.so
)

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
    -Dbluez5-codec-aac=enabled
    -Dbluez5-codec-aptx=enabled
    -Dbluez5-codec-g722=enabled
    -Dbluez5-codec-lc3=enabled
    -Dbluez5-codec-lc3plus=disabled
    -Dbluez5-codec-ldac=enabled
    -Dbluez5-codec-ldac-dec=disabled
    -Dbluez5-codec-lhdc=enabled
    -Dbluez5-codec-opus=enabled
    -Ddbus=enabled
    -Dlibusb=enabled
    -Dopus=enabled
    -Dselinux=disabled
  )

  meson setup build pipewire "${meson_options[@]}"
  ninja -C build "${_bluez5_plugins[@]/#/spa\/plugins\/bluez5\/}"
}

package() {
  local plugin
  for plugin in "${_bluez5_plugins[@]}"; do
    install -Dm755 "build/spa/plugins/bluez5/$plugin" \
      "$pkgdir/usr/lib/spa-0.2-lhdc/bluez5/$plugin"
  done

  install -Dm644 pipewire/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
