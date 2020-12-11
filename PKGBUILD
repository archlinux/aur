# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: hexchain

_pkgbase=pipewire
pkgbase=pipewire-nightly
pkgname=(pipewire-nightly pipewire-docs-nightly pipewire-jack-nightly
    pipewire-pulse-nightly pipewire-alsa-nightly gst-plugin-pipewire-nightly)
pkgver=0.3.17.r89.g4ef0ef46
pkgrel=2
pkgdesc="Server and user space API to deal with multimedia pipelines (git version)"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(alsa-lib bluez-libs dbus doxygen git graphviz gst-plugins-base
    jack2 libopenaptx libpulse libsndfile meson rtkit sbc valgrind
    vulkan-headers vulkan-icd-loader xmltoman)
source=("git+https://github.com/PipeWire/pipewire")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
}

build() {
  arch-meson $_pkgbase build \
    -D docs=true \
    -D udevrulesdir=/usr/lib/udev/rules.d
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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

package_pipewire-nightly() {
  depends=(sbc rtkit vulkan-icd-loader bluez-libs alsa-card-profiles
      libopenaptx libdbus-1.so libsndfile.so libudev.so libasound.so
      libsystemd.so)
  optdepends=('pipewire-docs: Documentation'
              'pipewire-jack: JACK support'
              'pipewire-pulse: PulseAudio support')
  provides=(libpipewire-$_ver.so pipewire)
  conflicts=(pipewire)
  backup=(etc/pipewire/pipewire.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick gst usr/lib/gstreamer-1.0

  # Use alsa-card-profiles built with Pulseaudio
  rm -rv "$pkgdir"/usr/share/alsa-card-profile
}

package_pipewire-docs-nightly() {
  pkgdesc+=" (documentation)"
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  mv docs/* "$pkgdir"
}

package_pipewire-jack-nightly() {
  pkgdesc+=" (JACK support)"
  depends=(pipewire libpipewire-$_ver.so libjack.so)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)
  mv jack/* "$pkgdir"
}

package_pipewire-pulse-nightly() {
  pkgdesc+=" (PulseAudio replacement)"
  depends=(pipewire libpulse)
  provides=(pulseaudio pulseaudio-bluetooth pipewire-pulse)
  conflicts=(pulseaudio pulseaudio-bluetooth pipewire-pulse)
  install=pipewire-pulse.install
  mv pulse/* "$pkgdir"
}

package_pipewire-alsa-nightly() {
  pkgdesc="ALSA Configuration for PipeWire"
  depends=(pipewire libpipewire-$_ver.so)
  provides=(pulseaudio-alsa pipewire-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}

package_gst-plugin-pipewire-nightly() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  mv gst/* "$pkgdir"
}

options+=(!strip debug)
