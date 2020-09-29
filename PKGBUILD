# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-pipewire
pkgname=(lib32-pipewire lib32-pipewire-jack lib32-pipewire-pulse)
pkgver=0.3.13
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines (32-bit client libraries)"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson valgrind lib32-jack2 lib32-libpulse lib32-alsa-lib
             lib32-gstreamer lib32-gst-plugins-base lib32-sbc rtkit
             lib32-vulkan-icd-loader dbus lib32-libsndfile lib32-bluez-libs
             vulkan-headers)
_commit=d7714f734dcf2a346f939e11e1e3f6a2373c8632  # tags/0.3.13
source=("git+https://github.com/PipeWire/pipewire#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pipewire
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson pipewire build \
    --libdir /usr/lib32 \
    -D docs=false \
    -D tests=false \
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

package_lib32-pipewire() {
  depends=(lib32-gstreamer lib32-gst-plugins-base lib32-sbc rtkit
           lib32-vulkan-icd-loader lib32-bluez-libs
           lib32-dbus lib32-libsndfile lib32-libudev0-shim lib32-alsa-lib
           lib32-systemd lib32-glib2)
  optdepends=('lib32-pipewire-jack: JACK support'
              'lib32-pipewire-pulse: PulseAudio support')

  DESTDIR="$srcdir/install" meson install -C build

  _pick $srcdir/install/usr/lib32/spa-0.2/jack
  mv $pkgdir/usr $srcdir/jack

  _pick $srcdir/install/usr/lib32/libpipewire-$_ver.so*
  _pick $srcdir/install/usr/lib32/alsa-lib/*
  _pick $srcdir/install/usr/lib32/gstreamer-1.0/*
  _pick $srcdir/install/usr/lib32/pipewire-0.3/libpipewire-module-*.so
  _pick $srcdir/install/usr/lib32/pkgconfig/*
  _pick $srcdir/install/usr/lib32/spa-0.2/*
}

package_lib32-pipewire-jack() {
  pkgdesc+=" (JACK support)"
  depends=(lib32-pipewire=$pkgver lib32-jack2)
  _pick $srcdir/install/usr/lib32/pipewire-$_ver/jack/*
  mv $srcdir/jack/lib32/spa-0.2 $pkgdir/usr/lib32/spa-0.2
}

package_lib32-pipewire-pulse() {
  pkgdesc+=" (PulseAudio support)"
  depends=(lib32-pipewire=$pkgver lib32-glib2)
  _pick $srcdir/install/usr/lib32/pipewire-$_ver/pulse/*
}
