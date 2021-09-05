# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# editor's note: trying to avoid suffix on everything that remains unchanged/does not link against udev
pkgname=pipewire-libudev-zero
# REMAIN UNCHANGED: 'alsa-card-profiles' 'pipewire-docs' 'gst-plugin-pipewire' 'pipewire-zeroconf' 'pipewire-pulse' 'pipewire-jack' 'pipewire-alsa'
pkgver=0.3.34
pkgrel=1
epoch=1
pkgdesc="Low-latency audio/video router and processor - libudev-zero ready edition"
url="https://github.com/illiliti/libudev-zero/issues/26"
license=(MIT)
arch=(x86_64)
depends=(rtkit alsa-card-profiles libdbus-1.so libncursesw.so libsndfile.so
             libudev.so libusb-1.0.so libasound.so libbluetooth.so
             libsbc.so libldacBT_enc.so libfreeaptx.so libfdk-aac.so
             libwebrtc_audio_processing.so)
optdepends=('pipewire-docs: Documentation'
            'pipewire-media-session: Default session manager'
            'pipewire-alsa: ALSA configuration'
            'pipewire-jack: JACK support'
            'pipewire-pulse: PulseAudio replacement'
            'gst-plugin-pipewire: GStreamer support'
            'pipewire-zeroconf: Zeroconf support')
makedepends=(git meson doxygen xmltoman valgrind libpulse alsa-lib libusb
             gst-plugins-base rtkit dbus sdl2 ncurses libsndfile bluez-libs sbc
             libldac libfreeaptx libfdk-aac avahi webrtc-audio-processing)
checkdepends=(desktop-file-utils)
_commit=1924c2c29824955b5e763f1def6967f68e403c7c  # tags/0.3.34
source=("git+https://gitlab.freedesktop.org/pipewire/pipewire.git#commit=$_commit" luz.patch)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd pipewire
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pipewire
  git apply --reject ../luz.patch
}

build() {
  local meson_options=(
    -D docs=enabled
    -D jack=disabled
    -D libcamera=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D systemd=disabled
    -D roc=disabled
  )

  artix-meson pipewire build "${meson_options[@]}"
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

package() {
  license+=(LGPL)  # libspa-alsa
  conflicts=(pipewire)
  provides=(libpipewire-$_ver.so pipewire)

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick acp usr/lib/udev
    _pick acp usr/share/alsa-card-profile

    _pick docs usr/share/doc

    _pick pms usr/bin/pipewire-media-session
    _pick pms usr/share/pipewire/media-session.d/*.conf

    _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
    _pick jack usr/share/man/man1/pw-jack.1
    _pick jack usr/share/pipewire/{jack.conf,media-session.d/with-jack}

    _pick pulse usr/bin/pipewire-pulse
    _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-protocol-pulse.so
    _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-pulse-tunnel.so
    _pick pulse usr/share/pipewire/media-session.d/with-pulseaudio

    _pick gst usr/lib/gstreamer-1.0

    _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-zeroconf-discover.so
  )

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}
