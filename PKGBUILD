# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-pipewire
_pkgbase=pipewire
pkgname=(lib32-pipewire lib32-pipewire-jack lib32-gst-plugin-pipewire)
pkgver=0.3.18
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines (32-bit client libraries)"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson valgrind lib32-jack2 lib32-libpulse lib32-alsa-lib
             lib32-gstreamer lib32-gst-plugins-base lib32-sbc rtkit
             lib32-vulkan-icd-loader lib32-dbus lib32-libsndfile
             vulkan-headers)
_commit=e7dffd64ebff76e2388d6e694de96d6693a6ed7d  # tags/0.3.18
source=("git+https://github.com/PipeWire/pipewire#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbase

  # fix kwin
  git cherry-pick -n fc2b0b20ad4271b0c6f258451a82311b792b7a57
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson $_pkgbase build \
    --libdir /usr/lib32 \
    -D docs=false \
    -D tests=false \
    -D bluez5=false \
    -D udevrulesdir=/usr/lib/udev/rules.d
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local f d
  for f; do
    d="$pkgdir/${f#$srcdir/install/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_ver=${pkgver:0:3}
_spaver="0.2"

package_lib32-pipewire() {
  depends=(lib32-sbc rtkit lib32-vulkan-icd-loader alsa-card-profiles
           lib32-dbus lib32-libsndfile lib32-libudev0-shim lib32-alsa-lib
           lib32-systemd lib32-glib2)
  optdepends=('lib32-pipewire-jack: JACK support')

  DESTDIR="$srcdir/install" meson install -C build

  _pick "$srcdir"/install/usr/lib32/spa-$_spaver/jack
  mv $pkgdir/usr $srcdir/jack

  _pick "$srcdir"/install/usr/lib32/libpipewire-$_ver.so*
  _pick "$srcdir"/install/usr/lib32/alsa-lib/*
  _pick "$srcdir"/install/usr/lib32/pipewire-$_ver/libpipewire-module-*.so
  _pick "$srcdir"/install/usr/lib32/pkgconfig/*
  _pick "$srcdir"/install/usr/lib32/spa-$_spaver/*
}

package_lib32-pipewire-jack() {
  pkgdesc+=" (JACK support)"
  depends=(lib32-pipewire=$pkgver lib32-jack2)
  _pick "$srcdir"/install/usr/lib32/pipewire-$_ver/jack/*
  mv "$srcdir"/jack/lib32/spa-$_spaver "$pkgdir"/usr/lib32/spa-$_spaver
}

package_lib32-gst-plugin-pipewire() {
  pkgdesc="Multimedia graph framework - pipewire plugin (32-bit version)"
  depends=(lib32-pipewire=$pkgver lib32-gst-plugins-base-libs)
  _pick "$srcdir"/install/usr/lib32/gstreamer-1.0
}
