#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-ffmpeg-git'
         'pipewire-media-session-git'
         'alsa-card-profiles-git'
         'pipewire-zeroconf-git'
         )
pkgver=0.3.32.71.g8375d7b2d
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('MIT')
makedepends=('git'
             'meson'
             'doxygen'
             'graphviz'
             'xmltoman'
             'valgrind'
             'libpulse'
             'alsa-lib'
             'sbc'
             'rtkit'
             'dbus'
             'sdl2'
             'ncurses'
             'libsndfile'
             'bluez-libs'
             'ffmpeg'
             'libldac'
             'libfreeaptx'
             'libfdk-aac'
             'libcamera-git'
             'vulkan-headers'
             'avahi'
             'webrtc-audio-processing'
#              'roc-git'
             )
checkdepends=('desktop-file-utils')
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${srcdir}/build"

  arch-meson ../pipewire \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=enabled \
    -D jack=disabled \
    -D gstreamer=disabled \
    -D gstreamer-device-provider=disabled \
    -D roc=disabled \
    -D ffmpeg=enabled \
    -D jack-devel=enabled \
    -D libjack-path=/usr/lib

  ninja
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="${1}" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#$pkgdir/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_pipewire-git() {
  depends=("alsa-card-profiles-git=${pkgver}"
           'rtkit'
           'libasound.so'
           'libbluetooth.so'
           'libdbus-1.so'
           'libfdk-aac.so'
           'libldacBT_enc.so'
           'libncursesw.so'
           'libfreeaptx.so'
           'libsbc.so'
           'libsndfile.so'
           'libsystemd.so'
           'libudev.so'
           'libvulkan.so'
           'libcamera-git'
           'libwebrtc_audio_processing.so'
           'libusb-1.0.so'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-ffmpeg-git: ffmpeg support'
              'pipewire-media-session-git: Default session manager'
              'gst-plugin-pipewire-git: gstreamer support'
              'pipewire-zeroconf-git: Zeroconf support'
              )
  provides=('pipewire'
            "libpipewire-${pkgver:0:3}.so"
            )
  conflicts=('pipewire')
  backup=(etc/pipewire/{pipewire{,-pulse},client{,-rt}}.conf
          usr/share/pipewire/{pipewire{,-pulse},client{,-rt}}.conf
          )
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  (cd "${pkgdir}"

  _pick acp usr/lib/udev
  _pick acp usr/share/alsa-card-profile

  _pick docs usr/share/doc

  _pick pms usr/bin/pipewire-media-session
  _pick pms usr/lib/systemd/user/pipewire-media-session.service
  _pick pms usr/share/pipewire/media-session.d/*.conf

  _pick jack usr/bin/pw-jack usr/lib/libjack* usr/lib/pkgconfig/jack.pc
  _pick jack usr/include/jack
  _pick jack usr/share/pipewire/{jack.conf,media-session.d/with-jack}
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse "usr/lib/pipewire-${pkgver:0:3}/libpipewire-module-protocol-pulse.so"
  _pick pulse "usr/lib/pipewire-${pkgver:0:3}/libpipewire-module-pulse-tunnel.so"
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*
  _pick pulse usr/share/pipewire/media-session.d/with-pulseaudio

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg/libspa-ffmpeg.so

  _pick zeroconf "usr/lib/pipewire-${pkgver:0:3}/libpipewire-module-zeroconf-discover.so"
  )

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-docs-git() {
  pkgdesc+=" - documentation (GIT Version)"
  provides=('pipewire-docs')
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-jack-git() {
  pkgdesc+=" - JACK support (GIT version)"
  license+=('GPL2')  # libjackserver
  depends=("pipewire-media-session-git=${pkgver}"
           "libpipewire-${pkgver:0:3}.so"
           )
  backup=('etc/pipewire/jack.conf')
  provides=('pipewire-jack'
            'jack'
            'libjack.so'
            'libjackserver.so'
            )
  conflicts=('pipewire-jack'
            'jack'
            )

  mv jack/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-pulse-git() {
  pkgdesc+=" - PulseAudio replacement (GIT version)"
  depends=("pipewire-media-session-git=${pkgver}"
           "libpipewire-${pkgver:0:3}.so"
           'libpulse.so'
           'libavahi-client.so'
           'libavahi-common.so'
           )
  provides=('pipewire-pulse'
            'pulseaudio'
            'pulseaudio-bluetooth'
            )
  conflicts=('pipewire-pulse'
             'pulseaudio'
             'pulseaudio-bluetooth'
             )
  arch=('x86_64')
  install=pipewire-pulse.install

  mv pulse/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-alsa-git() {
  pkgdesc+=" - ALSA configuration (GIT version)"
  depends=("pipewire-media-session-git=${pkgver}")
  provides=('pipewire-alsa'
            'pulseaudio-alsa'
            )
  conflicts=('pipewire-alsa')
  arch=('any')

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-ffmpeg-git() {
  pkgdesc+=" - FFmpeg SPA plugin (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${pkgver:0:3}.so"
           'ffmpeg'
           )
  provides=('pipewire-ffmpeg')
  conflicts=('pipewire-ffmpeg')

  mv ffmpeg/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-media-session-git() {
  pkgdesc+=" - Session manager (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${pkgver:0:3}.so"
           )
  provides=('pipewire-media-session')
  conflicts=('pipewire-media-session')
  backup=('etc/pipewire/media-session.d/media-session.conf'
          etc/pipewire/media-session.d/{alsa,bluez,v4l2}-monitor.conf
          'usr/share/pipewire/media-session.d/media-session.conf'
          usr/share/pipewire/media-session.d/{alsa,bluez,v4l2}-monitor.conf
          )
  install=pipewire-media-session.install

  mv pms/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_alsa-card-profiles-git() {
  pkgdesc+=" - ALSA card profiles (GIT version)"
  provides=('alsa-card-profiles')
  conflicts=('alsa-card-profiles')
  license=('LGPL')
  arch=('any')

  mv acp/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-zeroconf-git() {
  pkgdesc+=" - Zeroconf support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${pkgver:0:3}.so"
           'libavahi-client.so'
           'libavahi-common.so'
           )
  provides=('pipewire-zeroconf')
  conflicts=('pipewire-zeroconf')

  mv zeroconf/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}
