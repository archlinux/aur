# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-common-git
pkgname=(pipewire-common-git
         pipewire-common-docs-git
         pipewire-common-alsa-git
         pipewire-common-jack-git
         pipewire-common-pulse-git
         pipewire-common-zeroconf-git
         gst-plugin-pipewire-common-git
         )
pkgver=0.3.32.r58.g1216371f
pkgrel=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen xmltoman ncurses
             libsndfile alsa-lib dbus rtkit libpulse
             webrtc-audio-processing libusb bluez-libs
             sbc libldac libopenaptx libfdk-aac
             avahi
             gst-plugins-base-libs
             )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git'
        '0001-Revert-bluez5-Use-libfreeaptx-instead-of-libopenaptx.patch')
sha256sums=('SKIP'
            '9545e10d4e702ee175bed80d1c030cb61ae267cc41809e107574a0e4ecba6811')

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
    -D jack=disabled \
    -D vulkan=disabled \
    -D ffmpeg=disabled \
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
  license+=(LGPL)
  depends=(rtkit libdbus-1.so libncursesw.so libsndfile.so
           libudev.so libasound.so libsystemd.so
           libwebrtc_audio_processing.so libusb-1.0.so
           libbluetooth.so libsbc.so libldacBT_{enc,abr}.so
           libopenaptx.so libfdk-aac.so)
  optdepends=('pipewire-common-docs-git: Documentation'
              'pipewire-common-alsa-git: ALSA configuration'
              'pipewire-common-jack-git: JACK support'
              'pipewire-common-pulse-git: PulseAudio replacement'
              'pipewire-common-zeroconf-git: Zeroconf support'
              'gst-plugin-pipewire-common-git: GStreamer support'
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
}

package_pipewire-common-docs-git() {
  arch=(any)
  options=(!strip)
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-common-git)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf
  install -Dm644 /dev/null "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-jack-git() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)
  depends=(pipewire-common-git libpipewire-$_ver.so bash)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)

  mv jack/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-common-git libpipewire-$_ver.so libpulse.so
           libavahi-{client,common}.so
           )
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-zeroconf-git() {
  pkgdesc+=" - Zeroconf support"
  depends=(pipewire-common-git libpipewire-$_ver.so
           libavahi-{client,common}.so)
  provides=(pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_gst-plugin-pipewire-common-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire-common-git libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
