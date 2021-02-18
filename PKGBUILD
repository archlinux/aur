# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-full-git
pkgname=(pipewire-full-git pipewire-full-docs-git pipewire-full-jack-git
         pipewire-full-pulse-git pipewire-full-alsa-git
         gst-plugin-pipewire-full-git
         pipewire-full-vulkan-git pipewire-full-ffmpeg-git
         pipewire-full-bluez5-git pipewire-full-bluez5-hsphfpd-git)
pkgver=0.3.22.r7.ga22602f4
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman jack2
             alsa-lib gst-plugins-base-libs sbc rtkit vulkan-icd-loader dbus
             sdl2 ncurses libsndfile bluez-libs vulkan-headers libldac 
             libopenaptx libfdk-aac ffmpeg)
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
  # make AUR helper happy
  rm -rf build
  arch-meson $_pkgbase build \
    -D docs=true \
    -D vulkan=true \
    -D ffmpeg=true \
    -D bluez5-backend-hsp-native=true \
    -D bluez5-backend-hfp-native=true \
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

package_pipewire-full-git() {
  depends=(rtkit
           libdbus-1.so libncursesw.so libsndfile.so libudev.so libasound.so
           libsystemd.so)
  optdepends=('pipewire-full-docs-git: Documentation'
              'pipewire-full-alsa-git: ALSA support'
              'pipewire-full-jack-git: JACK support'
              'pipewire-full-pulse-git: PulseAudio support'
              'gst-plugin-pipewire-full-git: GStreamer support'
              'pipewire-full-bluez5-git: Bluetooth audio support'
              'pipewire-full-bluez5-hsphfpd-git: Bluetooth audio support (using hsphfpd for HSP/HFP support)')
  provides=(pipewire alsa-card-profiles libpipewire-$_ver.so)
  conflicts=(pipewire alsa-card-profiles)
  backup=(etc/pipewire/{client-rt,client,pipewire}.conf
          etc/pipewire/media-session.d/media-session.conf
          etc/pipewire/media-session.d/{alsa,bluez,v4l2}-monitor.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 "$_pkgbase/COPYING" "$pkgdir/usr/share/licenses/$_pkgbase/COPYING"

  cd "$pkgdir"

  _pick bluez5 usr/lib/spa-0.2/bluez5


  # Rebuild with different options
  cd "$srcdir"

  meson configure build \
    -D bluez5-backend-hsp-native=false \
    -D bluez5-backend-hfp-native=false \
    -D bluez5-backend-ofono=false \
    -D bluez5-backend-hsphfpd=true
  meson compile -C build
  DESTDIR="$pkgdir" meson install -C build --only-changed

  cd "$pkgdir"

  _pick bluez5-hsphfpd usr/lib/spa-0.2/bluez5

  _pick docs usr/share/doc

  _pick jack etc/pipewire/jack.conf
  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/pipewire-pulse.conf
  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick gst usr/lib/gstreamer-1.0

  _pick vulkan usr/lib/spa-0.2/vulkan

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg
}

package_pipewire-full-docs-git() {
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" (documentation)"
  mv docs/* "$pkgdir"
}

package_pipewire-full-jack-git() {
  pkgdesc+=" (JACK support)"
  depends=(pipewire-full-git libpipewire-$_ver.so bash libjack.so)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)
  backup=(etc/pipewire/jack.conf)
  mv jack/* "$pkgdir"
}

package_pipewire-full-pulse-git() {
  pkgdesc+=" (PulseAudio replacement)"
  depends=(pipewire-full-git pipewire-bluez5 libpulse)
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install
  backup=(etc/pipewire/pipewire-pulse.conf)
  mv pulse/* "$pkgdir"
}

package_pipewire-full-alsa-git() {
  pkgdesc="ALSA Configuration for PipeWire"
  depends=(pipewire-full-git libpipewire-$_ver.so)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir"/etc/{alsa/conf.d,pipewire/media-session.d}
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf
  touch "$pkgdir/etc/pipewire/media-session.d/with-alsa"
}

package_gst-plugin-pipewire-full-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire-full-git libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  mv gst/* "$pkgdir"
}

package_pipewire-full-vulkan-git() {
  pkgdesc+=" (Vulkan SPA plugin)"
  depends=(pipewire-full-git libpipewire-$_ver.so vulkan-icd-loader)
  provides=(pipewire-vulkan)
  conflicts=(pipewire-vulkan)
  mv vulkan/* "${pkgdir}"
}

package_pipewire-full-ffmpeg-git() {
  pkgdesc+=" (FFmpeg SPA plugin)"
  depends=(pipewire-full-git libpipewire-$_ver.so libavcodec.so libavformat.so)
  provides=(pipewire-ffmpeg)
  conflicts=(pipewire-ffmpeg)
  mv ffmpeg/* "${pkgdir}"
}

package_pipewire-full-bluez5-git() {
  pkgdesc+=" (BlueZ 5 SPA plugin)"
  depends=(pipewire-full-git libpipewire-$_ver.so bluez-libs sbc
           libdbus-1.so libldacBT_enc.so libopenaptx.so libfdk-aac.so)
  optdepends=('ofono: HFP support')
  provides=(pipewire-bluez5)
  conflicts=(pipewire-bluez5)
  mv bluez5/* "${pkgdir}"
}

package_pipewire-full-bluez5-hsphfpd-git() {
  pkgdesc+=" (BlueZ 5 SPA plugin, using hsphfpd for HSP/HFP support)"
  depends=(pipewire-full-git libpipewire-$_ver.so bluez-libs sbc hsphfpd
           libdbus-1.so libldacBT_enc.so libopenaptx.so libfdk-aac.so)
  provides=(pipewire-bluez5)
  conflicts=(pipewire-bluez5)
  mv bluez5-hsphfpd/* "${pkgdir}"
}
