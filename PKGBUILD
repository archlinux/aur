# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-common-git
pkgname=(pipewire-common-git pipewire-common-docs-git pipewire-common-jack-git
         pipewire-common-pulse-git pipewire-common-alsa-git
         gst-plugin-pipewire-common-git pipewire-common-ffmpeg-git
         pipewire-common-bluez5-git pipewire-common-bluez5-hsphfpd-git)
pkgver=0.3.19.r37.g86576f1e
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman valgrind jack2 libpulse
             alsa-lib gst-plugins-base sbc rtkit vulkan-icd-loader dbus sdl2
             ncurses libsndfile bluez-libs vulkan-headers libldac libopenaptx
             libfdk-aac ffmpeg)
source=("git+https://gitlab.freedesktop.org/pipewire/pipewire.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
}

build() {
  arch-meson $_pkgbase build
  meson configure build \
    -D docs=true \
    -D ffmpeg=true \
    -D bluez5-backend-native=true \
    -D bluez5-backend-ofono=true \
    -D bluez5-backend-hsphfpd=false \
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

package_pipewire-common-git() {
  depends=(sbc rtkit vulkan-icd-loader alsa-card-profiles
           libdbus-1.so libncursesw.so libsndfile.so libudev.so libasound.so
           libsystemd.so)
  optdepends=('pipewire-common-docs-git: Documentation'
              'pipewire-common-alsa-git: ALSA support'
              'pipewire-common-jack-git: JACK support'
              'pipewire-common-pulse-git: PulseAudio support'
              'gst-plugin-pipewire-common-git: GStreamer support'
              'pipewire-common-ffmpeg-git: FFmpeg support'
              'pipewire-common-bluez5-git: Bluetooth audio support'
              'pipewire-common-bluez5-hsphfpd-git: Bluetooth audio support (using hsphfpd for HSP/HFP support)')
  provides=(pipewire libpipewire-$_ver.so)
  conflicts=(pipewire)
  backup=(etc/pipewire/pipewire.conf
          etc/pipewire/media-session.d/{alsa-monitor,media-session}.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick bluez5 usr/lib/spa-0.2/bluez5


  # Rebuild with different options
  cd "$srcdir"

  meson configure build \
    -D bluez5-backend-native=false \
    -D bluez5-backend-ofono=false \
    -D bluez5-backend-hsphfpd=true
  meson compile -C build
  DESTDIR="$pkgdir" meson install -C build --only-changed

  cd "$pkgdir"

  _pick bluez5-hsphfpd usr/lib/spa-0.2/bluez5

  _pick docs usr/share/doc

  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick gst usr/lib/gstreamer-1.0

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg

  # Use alsa-card-profiles built with Pulseaudio
  rm -rv "$pkgdir"/usr/share/alsa-card-profile
}

package_pipewire-common-docs-git() {
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" (documentation)"
  mv docs/* "$pkgdir"
}

package_pipewire-common-jack-git() {
  pkgdesc+=" (JACK support)"
  depends=(pipewire libpipewire-$_ver.so libjack.so)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)
  mv jack/* "$pkgdir"
}

package_pipewire-common-pulse-git() {
  pkgdesc+=" (PulseAudio replacement)"
  depends=(pipewire pipewire-bluez5 libpulse)
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install
  mv pulse/* "$pkgdir"
}

package_pipewire-common-alsa-git() {
  pkgdesc="ALSA Configuration for PipeWire"
  depends=(pipewire libpipewire-$_ver.so)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir"/etc/{alsa/conf.d,pipewire/media-session.d}
  ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
  touch "$pkgdir/etc/pipewire/media-session.d/with-alsa"
}

package_gst-plugin-pipewire-common-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  mv gst/* "$pkgdir"
}

package_pipewire-common-ffmpeg-git() {
  pkgdesc+=" (FFmpeg SPA plugin)"
  depends=(pipewire libpipewire-$_ver.so libavcodec.so libavformat.so)
  provides=(pipewire-ffmpeg)
  conflicts=(pipewire-ffmpeg)
  mv ffmpeg/* "${pkgdir}"
}

package_pipewire-common-bluez5-git() {
  pkgdesc+=" (BlueZ 5 SPA plugin)"
  depends=(pipewire libpipewire-$_ver.so bluez-libs
           libldacBT_enc.so libopenaptx.so libfdk-aac.so)
  provides=(pipewire-bluez5)
  conflicts=(pipewire-bluez5)
  mv bluez5/* "${pkgdir}"
}

package_pipewire-common-bluez5-hsphfpd-git() {
  pkgdesc+=" (BlueZ 5 SPA plugin, using hsphfpd for HSP/HFP support)"
  depends=(pipewire libpipewire-$_ver.so bluez-libs hsphfpd
           libldacBT_enc.so libopenaptx.so libfdk-aac.so)
  provides=(pipewire-bluez5)
  conflicts=(pipewire-bluez5)
  mv bluez5-hsphfpd/* "${pkgdir}"
}
