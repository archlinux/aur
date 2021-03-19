# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-common-git
pkgname=(pipewire-common-git pipewire-common-docs-git pipewire-common-alsa-git
         pipewire-common-jack-git pipewire-common-pulse-git
         gst-plugin-pipewire-common-git)
pkgver=0.3.24.r6.gdb85339f
pkgrel=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman
             alsa-lib gst-plugins-base-libs sbc rtkit dbus sdl2
             ncurses libsndfile bluez-libs libldac libopenaptx
             libfdk-aac)
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
  rm -rf build || true
  arch-meson $_pkgbase build \
    -D docs=enabled \
    -D ffmpeg=disabled \
    -D jack=disabled \
    -D libcamera=disabled \
    -D vulkan=disabled \
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
  depends=(rtkit libdbus-1.so libncursesw.so libsndfile.so
           libudev.so libasound.so libsystemd.so libbluetooth.so
           libsbc.so libldacBT_enc.so libopenaptx.so libfdk-aac.so)
  optdepends=('pipewire-common-docs-git: Documentation'
              'pipewire-common-alsa-git: ALSA support'
              'pipewire-common-jack-git: JACK support'
              'pipewire-common-pulse-git: PulseAudio support'
              'gst-plugin-pipewire-common-git: GStreamer support'
              'ofono: ofono HFP support'
              'hsphfpd: hsphfpd HSP/HFP support')
  provides=(pipewire pipewire-media-session alsa-card-profiles libpipewire-$_ver.so)
  conflicts=(pipewire pipewire-media-session alsa-card-profiles)
  backup=(etc/pipewire/{pipewire{,-pulse},client{,-rt}}.conf
          etc/pipewire/media-session.d/media-session.conf
          etc/pipewire/media-session.d/{alsa,bluez,v4l2}-monitor.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 "$_pkgbase/COPYING" "$pkgdir/usr/share/licenses/$_pkgbase/COPYING"

  cd "$pkgdir"

  _pick docs usr/share/doc

  _pick jack etc/pipewire/{jack.conf,media-session.d/with-jack}
  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick gst usr/lib/gstreamer-1.0
}

package_pipewire-common-docs-git() {
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" - documentation"
  mv docs/* "$pkgdir"
}

package_pipewire-common-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-common-git)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf
  install -Dm644 /dev/null "$pkgdir/etc/pipewire/media-session.d/with-alsa"
}

package_pipewire-common-jack-git() {
  pkgdesc+=" - JACK support"
  depends=(pipewire-common-git libpipewire-$_ver.so bash)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)
  backup=(etc/pipewire/jack.conf)
  mv jack/* "$pkgdir"
}

package_pipewire-common-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-common-git libpulse)
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install
  mv pulse/* "$pkgdir"
}

package_gst-plugin-pipewire-common-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire-common-git libpipewire-$_ver.so gst-plugins-base-libs)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  mv gst/* "$pkgdir"
}
