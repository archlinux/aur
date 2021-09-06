# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-pipewire-git
_pkgbase=pipewire
pkgname=(lib32-pipewire-git lib32-pipewire-jack-git)
pkgver=0.3.34.r73.g435de9942
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (git) (32 bit client libraries)'
url=https://pipewire.org
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson lib32-alsa-lib lib32-systemd lib32-dbus)
source=(git+https://gitlab.freedesktop.org/pipewire/pipewire.git)
sha256sums=('SKIP')

pkgver() {
  git -C ${_pkgbase} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    --libdir /usr/lib32
    -D examples=disabled
    -D man=disabled
    -D tests=disabled
    -D gstreamer=disabled
    -D gstreamer-device-provider=disabled
    -D systemd-user-service=disabled
    -D bluez5=disabled
    -D jack=disabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D pw-cat=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D sdl2=disabled
    -D sndfile=disabled
    -D libpulse=disabled
    -D roc=disabled
    -D avahi=disabled
    -D echo-cancel-webrtc=disabled
    -D libusb=disabled
    -D session-managers="[]"
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson pipewire build "${meson_options[@]}"
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_ver=${pkgver:0:3}

package_lib32-pipewire-git() {
  depends=(pipewire lib32-systemd libdbus-1.so libasound.so)
  optdepends=('lib32-pipewire-jack: JACK support')
  provides=(libpipewire-$_ver.so)

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"
 
    _pick jack usr/lib32/pipewire-$_ver/jack
 
    rm -r usr/{bin,include,lib,share}
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_lib32-pipewire-jack-git() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)  # libjackserver
  depends=(pipewire-jack lib32-pipewire libpipewire-$_ver.so)

  mv jack/* "$pkgdir"
 
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}
