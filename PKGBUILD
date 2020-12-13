# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=lib32-libpulse-nosystemd-minimal-git
pkgdesc="A featureful, general-purpose sound server (32-bit client libraries)"
pkgver=13.99.1+98+g460d0c0b7
pkgrel=1
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(LGPL)
depends=(lib32-{dbus,libasyncns,libcap,libxtst,libsm,libsndfile})
makedepends=(lib32-{speexdsp,glib2} git meson libpulse lib32-tdb)
optdepends=('lib32-alsa-plugins: ALSA support'
            'libpulse: 64bit support')
provides=(lib32-pulseaudio lib32-libpulse)
conflicts=(lib32-pulseaudio lib32-libpulse)
replaces=(lib32-pulseaudio)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git")
sha256sums=('SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pulseaudio

}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson pulseaudio build \
    --libdir /usr/lib32 \
    --auto-features auto \
    -D man=false \
    -D tests=false \
    -D avahi=disabled \
    -D bluez5=false \
    -D gcov=false \
    -D systemd=disabled \
    -D legacy-database-entry-format=false \
    -D asyncns=disabled \
    -D bluez5-native-headset=false \
    -D bluez5-ofono-headset=false \
    -D dbus=disabled \
    -D fftw=disabled \
    -D glib=enabled \
    -D gsettings=disabled \
    -D gstreamer=disabled \
    -D gtk=disabled \
    -D ipv6=false \
    -D jack=disabled \
    -D lirc=disabled \
    -D openssl=disabled \
    -D oss-output=false \
    -D soxr=disabled \
    -D speex=enabled \
    -D valgrind=disabled \
    -D adrian-aec=false \
    -D webrtc-aec=disabled \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d
  meson compile -C build

# glib required for libpulse.so creation
}

#check() {
#  meson test -C build --print-errorlogs
#}

_pick() {
  local f d
  for f; do
    d="$pkgdir/${f#$srcdir/install/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package() {
  DESTDIR="$srcdir/install" meson install -C build

  cd install
  _pick usr/lib32/libpulse{,-simple,-mainloop-glib}.so*
  _pick usr/lib32/{cmake,pkgconfig}
  _pick usr/lib32/pulseaudio/libpulsecommon-*.so
}
# vim:set sw=2 et:

