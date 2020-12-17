# Maintainer: tinywrkb <tinywrkb@gmail.com>
#
# pipewire package maintainers:
#   Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#   Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-gstfree
_pkgbase=pipewire
pkgname=(pipewire-gstfree pipewire-gstfree-docs pipewire-gstfree-jack pipewire-gstfree-pulse pipewire-gstfree-alsa pipewire-gstfree-ffmpeg)
pkgver=0.3.18
pkgrel=2
pkgdesc="Server and user space API to deal with multimedia pipelines. packaged without gstreamer dependencies"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman valgrind jack2 libpulse
             alsa-lib sbc rtkit vulkan-icd-loader dbus
             libsndfile bluez-libs vulkan-headers libopenaptx libldac ffmpeg)
_commit=e7dffd64ebff76e2388d6e694de96d6693a6ed7d  # tags/0.3.18
source=("git+https://github.com/PipeWire/pipewire#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgbase build \
    -D gstreamer=false \
    -D ffmpeg=true \
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

package_pipewire-gstfree() {
  depends=(sbc rtkit vulkan-icd-loader bluez-libs alsa-card-profiles
           libdbus-1.so libsndfile.so libudev.so libasound.so libsystemd.so
           libldacBT_enc.so libopenaptx.so)
  optdepends=('pipewire-gstfree-docs: Documentation'
              'pipewire-gstfree-ffmpeg: ffmpeg support'
              'pipewire-gstfree-jack: JACK support'
              'pipewire-gstfree-pulse: PulseAudio support')
  conflicts=(pipewire)
  provides=(pipewire libpipewire-$_ver.so)
  backup=(etc/pipewire/pipewire.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg/libspa-ffmpeg.so

  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  # Use alsa-card-profiles built with Pulseaudio
  rm -rv "$pkgdir"/usr/share/alsa-card-profile
}

package_pipewire-gstfree-docs() {
  pkgdesc+=" (documentation)"
  mv docs/* "$pkgdir"
}

package_pipewire-gstfree-jack() {
  pkgdesc+=" (JACK support)"
  depends=(pipewire-gstfree libpipewire-$_ver.so libjack.so)
  conflicts=(pipewire-jack)
  provides=(pipewire-jack)
  mv jack/* "$pkgdir"
}

package_pipewire-gstfree-pulse() {
  pkgdesc+=" (PulseAudio replacement)"
  depends=(pipewire-gstfree libpulse)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install
  mv pulse/* "$pkgdir"
}

package_pipewire-gstfree-alsa() {
  pkgdesc="ALSA Configuration for PipeWire"
  depends=(pipewire-gstfree libpipewire-$_ver.so)
  conflicts=(pipewire-alsa)
  provides=(pipewire-alsa pulseaudio-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}

package_pipewire-gstfree-ffmpeg() {
  pkgdesc="Server and user space API to deal with multimedia pipelines. (FFmpeg SPA plugin)"
  depends=(pipewire-gstfree libpipewire-$_ver.so ffmpeg)
  conflicts=(pipewire-ffmpeg)
  provides=(pipewire-ffmpeg)

  mv ffmpeg/* "$pkgdir"
}
