# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-full-git
pkgname=(pipewire-full-git
         pipewire-full-docs-git
         pipewire-full-alsa-git
         pipewire-full-jack-git
         pipewire-full-pulse-git
         pipewire-full-zeroconf-git
         gst-plugin-pipewire-full-git
         pipewire-full-jack-client-git
         pipewire-full-vulkan-git
         pipewire-full-ffmpeg-git
         )
pkgver=0.3.32.r60.g6773ea7e
pkgrel=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen xmltoman ncurses
             libsndfile alsa-lib dbus rtkit libpulse
             webrtc-audio-processing libusb bluez-libs
             sbc libldac libfreeaptx libfdk-aac
             avahi
             gst-plugins-base-libs
             jack2
             vulkan-headers vulkan-icd-loader
             ffmpeg
             )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  # make AUR helper happy
  rm -rf build || true
  arch-meson $_pkgbase build \
    -D docs=enabled \
    -D test=enabled \
    -D libcamera=disabled \
    -D sdl2=disabled \
    -D roc=disabled \
    -D vulkan=enabled \
    -D ffmpeg=enabled \
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

package_pipewire-full-git() {
  license+=(LGPL)
  depends=(rtkit libdbus-1.so libncursesw.so libsndfile.so
           libudev.so libasound.so libsystemd.so
           libwebrtc_audio_processing.so libusb-1.0.so
           libbluetooth.so libsbc.so libldacBT_{enc,abr}.so
           libfreeaptx.so libfdk-aac.so)
  optdepends=('pipewire-full-docs-git: Documentation'
              'pipewire-full-alsa-git: ALSA configuration'
              'pipewire-full-jack-git: JACK support'
              'pipewire-full-jack-client-git: JACK device/client'
              'pipewire-full-pulse-git: PulseAudio replacement'
              'pipewire-full-zeroconf-git: Zeroconf support'
              'gst-plugin-pipewire-full-git: GStreamer support'
              'ofono: ofono Bluetooth HFP support'
              'hsphfpd: hsphfpd Bluetooth HSP/HFP support')
  provides=(pipewire pipewire-media-session alsa-card-profiles libpipewire-$_ver.so)
  conflicts=(pipewire pipewire-media-session alsa-card-profiles)
  install=pipewire.install

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING

  cd "$pkgdir"

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/share/man/man1/pw-jack.1
  _pick jack usr/share/pipewire/{jack.conf,media-session.d/with-jack}

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-protocol-pulse.so
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-pulse-tunnel.so
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*
  _pick pulse usr/share/pipewire/media-session.d/with-pulseaudio

  _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-zeroconf-discover.so

  _pick gst usr/lib/gstreamer-1.0

  _pick jack-client usr/lib/spa-0.2/jack

  _pick vulkan usr/lib/spa-0.2/vulkan

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg
}

package_pipewire-full-docs-git() {
  arch=(any)
  options=(!strip)
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-full-git)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf
  install -Dm644 /dev/null "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-jack-git() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)
  depends=(pipewire-full-git libpipewire-$_ver.so bash)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)

  mv jack/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-full-git libpipewire-$_ver.so libpulse.so
           libavahi-{client,common}.so
           )
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-zeroconf-git() {
  pkgdesc+=" - Zeroconf support"
  depends=(pipewire-full-git libpipewire-$_ver.so
           libavahi-{client,common}.so)
  provides=(pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_gst-plugin-pipewire-full-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire-full-git libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-jack-client-git() {
  pkgdesc="JACK client SPA plugin"
  depends=(pipewire-full-git libjack.so)
  provides=(pipewire-jack-client)
  conflicts=(pipewire-jack-client)

  mv jack-client/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-vulkan-git() {
  pkgdesc="Vulkan SPA plugin"
  depends=(pipewire-full-git vulkan-icd-loader)
  provides=(pipewire-vulkan)
  conflicts=(pipewire-vulkan)

  mv vulkan/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-ffmpeg-git() {
  pkgdesc="FFmpeg SPA plugin"
  depends=(pipewire-full-git libavcodec.so libavformat.so)
  provides=(pipewire-ffmpeg)
  conflicts=(pipewire-ffmpeg)

  mv ffmpeg/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
