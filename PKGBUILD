#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-ffmpeg-git'
         'pipewire-zeroconf-git'
         'pipewire-v4l2-git'
         'pipewire-roc-git'
         'pipewire-libcamera-git'
         )
pkgver=0.3.43.153.g4f57f3cda
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('MIT')
makedepends=('git'
             'meson'
             'doxygen'
             'graphviz'
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
             'vulkan-icd-loader'
             'avahi'
             'webrtc-audio-processing'
             'python-docutils'
             'lilv'
             'roc-toolkit-git'
             'libx11'
             'libcanberra'
             'chrpath'
             )
checkdepends=('desktop-file-utils'
              'valgrind'
              )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # remove export of LD_LIBRARY_PATH for pw-jack as it would add /usr/lib
  sed -e '/LD_LIBRARY_PATH/d' -i pipewire/pipewire-jack/src/pw-jack.in

  # silence warning about limit of DOT nodes
  echo 'DOT_GRAPH_MAX_NODES = 100' >> pipewire/doc/Doxyfile.in
}

build() {
  cd "${srcdir}/build"

  arch-meson ../pipewire \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=enabled \
    -D gstreamer=disabled \
    -D gstreamer-device-provider=disabled \
    -D roc=enabled \
    -D ffmpeg=enabled \
    -D vulkan=enabled \
    -D jack-devel=true \
    -D libjack-path=/usr/lib \
    -D session-managers=[]

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

_ver=${pkgver:0:3}

package_pipewire-git() {
  depends=('rtkit'
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
           'libwebrtc_audio_processing.so'
           'libusb-1.0.so'
           'liblilv-0.so'
           'libcanberra.so'
           'libx11'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-ffmpeg-git: ffmpeg support'
              'pipewire-session-manager: Session manager'
              'gst-plugin-pipewire-git: gstreamer support'
              'pipewire-zeroconf-git: Zeroconf support'
              'pipewire-v4l2-git: V4L2 interceptor'
              'pipewire-roc-git: ROC support'
              'pipewire-libcamera-git: libcamera support'
              )
  provides=("pipewire=${pkgver}"
            "libpipewire-${_ver}.so"
            )
  conflicts=('pipewire')
  backup=('usr/share/pipewire/client.conf'
          'usr/share/pipewire/client-rt.conf'
          'usr/share/pipewire/pipewire.conf'
          'usr/share/pipewire/minimal.conf'
          )
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  (cd "${pkgdir}"

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack
  _pick jack usr/include/jack
  _pick jack usr/lib/libjack*
  _pick jack usr/lib/pkgconfig/jack.pc
  _pick jack usr/lib/spa-0.2/jack/libspa-jack.so
  _pick jack usr/share/pipewire/jack.conf
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse "usr/lib/pipewire-${_ver}/libpipewire-module-protocol-pulse.so"
  _pick pulse "usr/lib/pipewire-${_ver}/libpipewire-module-pulse-tunnel.so"
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*
  _pick pulse usr/share/pipewire/pipewire-pulse.conf
  _pick pulse usr/share/man/man1/pipewire-pulse.1
  _pick pulse usr/lib/udev
  _pick pulse usr/share/alsa-card-profile

  _pick alsa usr/lib/alsa-lib
  _pick alsa usr/lib/spa-0.2/alsa/libspa-alsa.so
  _pick alsa usr/share/alsa

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg/libspa-ffmpeg.so

  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-zeroconf-discover.so"
  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-raop-discover.so"

  _pick v4l2 usr/bin/pw-v4l2
  _pick v4l2 "usr/lib/pipewire-${_ver}/v4l2"
  _pick v4l2 usr/lib/spa-0.2/v4l2/libspa-v4l2.so

  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-sink.so"
  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-source.so"

  _pick camera usr/lib/spa-0.2/libcamera

  )

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rtkit.so"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-docs-git() {
  pkgdesc+=" - documentation (GIT Version)"
  provides=("pipewire-docs=${pkgver}")
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-jack-git() {
  pkgdesc+=" - JACK support (GIT version)"
  license+=('GPL2')  # libjackserver
  depends=('pipewire-session-manager'
           "libpipewire-${_ver}.so"
           )
  backup=('usr/share/pipewire/jack.conf')
  provides=("pipewire-jack=${pkgver}"
            'jack'
            'libjack.so'
            'libjackserver.so'
            'libjacknet.so'
            )
  conflicts=('pipewire-jack'
             'jack'
             'jack2'
            )
  optdepends=('jack-example-tools: for official JACK example-clients and tools')

  mv jack/* "${pkgdir}"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-jack"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-pulse-git() {
  pkgdesc+=" - PulseAudio replacement (GIT version)"
  depends=('pipewire-session-manager'
           "libpipewire-${_ver}.so"
           'libpulse.so'
           'libavahi-client.so'
           'libavahi-common.so'
           )
  backup=('usr/share/pipewire/pipewire-pulse.conf')
  provides=("pipewire-pulse=${pkgver}"
            'pulseaudio'
            'pulseaudio-bluetooth'
            'alsa-card-profiles'
            )
  conflicts=('pipewire-pulse'
             'pulseaudio'
             'pulseaudio-bluetooth'
             'alsa-card-profiles'
             )
  install=pipewire-pulse.install

  mv pulse/* "${pkgdir}"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-alsa-git() {
  pkgdesc+=" - ALSA configuration (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'pipewire-session-manager'
          )
  backup=('usr/share/alsa/alsa.conf.d/50-pipewire.conf'
          'usr/share/alsa/alsa.conf.d/99-pipewire-default.conf'
          )
  provides=("pipewire-alsa=${pkgver}"
            'pulseaudio-alsa'
            )
  conflicts=('pipewire-alsa')

  mv alsa/* "${pkgdir}"

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-ffmpeg-git() {
  pkgdesc+=" - FFmpeg SPA plugin (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'ffmpeg'
           )
  provides=("pipewire-ffmpeg=${pkgver}")
  conflicts=('pipewire-ffmpeg')

  mv ffmpeg/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-zeroconf-git() {
  pkgdesc+=" - Zeroconf support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libavahi-client.so'
           'libavahi-common.so'
           )
  provides=("pipewire-zeroconf=${pkgver}")
  conflicts=('pipewire-zeroconf')

  mv zeroconf/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor (GIT version)"
  depends=("pipewire-git=${pkgver}"
           'pipewire-session-manager'
           "libpipewire-${_ver}.so"
           )
  provides=("pipewire-v4l2=${pkgver}")
  conflicts=('pipewire-v4l2')

  mv v4l2/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-roc-git() {
  pkgdesc+=" - ROC support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'roc-toolkit-git'
           )
  provides=("pipewire-roc=${pkgver}")
  conflicts=('pipewire-roc')

  mv roc/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-libcamera-git() {
  pkgdesc+=" - libcamera support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libcamera-git'
           )
  provides=("pipewire-libcamera=${pkgver}")
  conflicts=('pipewire-libcamera')

  mv camera/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}
