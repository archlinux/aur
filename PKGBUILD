#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-audio-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-ffmpeg-git'
         'pipewire-zeroconf-git'
         'pipewire-v4l2-git'
         'pipewire-roc-git'
         'pipewire-libcamera-git'
         'pipewire-x11-bell-git'
         )
pkgver=0.3.64.11.g5b42c07b1
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('MIT')
makedepends=('git'
             'meson'
             'libpulse'
             'alsa-lib'
             'sbc'
             'rtkit'
             'dbus'
             'systemd'
             'glib2'
             'sdl2'
             'ncurses'
             'libsndfile'
             'bluez-libs'
             'ffmpeg'
             'libldac'
             'opus'
             'libfreeaptx'
             'liblc3'
             'libfdk-aac'
             'libcamera'
             'vulkan-headers'
             'vulkan-icd-loader'
             'avahi'
             'webrtc-audio-processing'
             'lilv'
             'roc-toolkit'
             'libx11'
             'libxfixes'
             'libcanberra'
             'chrpath'
             'doxygen'
             'graphviz'
             'python-docutils'
             )
checkdepends=('desktop-file-utils'
              'valgrind'
              )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')
options=('debug')

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
  arch-meson pipewire build\
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=enabled \
    -D gstreamer=disabled \
    -D gstreamer-device-provider=disabled \
    -D roc=enabled \
    -D ffmpeg=enabled \
    -D vulkan=enabled \
    -D jack-devel=true \
    -D libjack-path=/usr/lib \
    -D session-managers=[] \
    -D bluez5-codec-lc3=enabled \
    -D bluez5-codec-lc3plus=disabled \
    -D volume=enabled

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local _p="${1}" _f _d; shift
  for _f; do
    _d="${srcdir}/${_p}/${_f#${pkgdir}/}"
    mkdir -p "$(dirname "${_d}")"
    mv "${_f}" "${_d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${_f}")"
  done
}

_ver=${pkgver:0:3}

package_pipewire-git() {
  depends=('libdbus-1.so'
           'libglib-2.0.so'
           'libncursesw.so'
           'libsystemd.so'
           'libudev.so'
           'libvulkan.so'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-audio-git: Audio support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-ffmpeg-git: ffmpeg support'
              'pipewire-session-manager: Session manager'
              'gst-plugin-pipewire-git: gstreamer support'
              'pipewire-zeroconf-git: Zeroconf support'
              'pipewire-v4l2-git: V4L2 interceptor'
              'pipewire-roc-git: ROC support'
              'pipewire-libcamera-git: libcamera support'
              'pipewire-x11-bell-git: X11 bell'
              'realtime-privileges: realtime privileges with rt module'
              'rtkit: realtime privileges with rtkit module'
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

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/"{client-rt,client,minimal,pipewire}.conf.d

  rm -fr "${srcdir}"/{audio,alsa,camera,docs,ffmpeg,jack,pulse,roc,v4l2,x11-bell,zeroconf}

  (cd "${pkgdir}"

  _pick audio usr/bin/pw-{cat,play,record,midi{play,record},dsdplay}
  _pick audio usr/bin/pw-{loopback,mididump}
  _pick audio usr/bin/spa-{acp-tool,resample}
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-echo-cancel.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-fallback-sink.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-filter-chain.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-loopback.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-pipe-tunnel.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-protocol-simple.so"
  _pick audio usr/lib/spa-0.2/{aec,audio*,bluez5,volume}
  _pick audio usr/lib/systemd/user/filter-chain.service
  _pick audio usr/share/man/man1/pw-{cat,mididump}.1
  _pick audio usr/share/pipewire/filter-chain*
  _pick audio usr/share/spa-0.2/bluez5

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack
  _pick jack usr/include/jack
  _pick jack usr/lib/libjack*
  _pick jack usr/lib/pkgconfig/jack.pc
  _pick jack usr/lib/spa-0.2/jack
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
  _pick alsa usr/lib/spa-0.2/alsa
  _pick alsa usr/share/alsa

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg

  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-zeroconf-discover.so"
  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-raop-discover.so"

  _pick v4l2 usr/bin/pw-v4l2
  _pick v4l2 "usr/lib/pipewire-${_ver}/v4l2"
  _pick v4l2 usr/lib/spa-0.2/v4l2

  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-sink.so"
  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-source.so"

  _pick camera usr/lib/spa-0.2/libcamera

  _pick x11-bell "usr/lib/pipewire-${_ver}/libpipewire-module-x11-bell.so"

  )

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rtkit.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-docs-git() {
  pkgdesc+=" - documentation (GIT Version)"
  provides=("pipewire-docs=${pkgver}")
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-audio-git() {
  pkgdesc+=" - Audio support (GIT Version)"
  depends=("libpipewire-${_ver}.so"
           'alsa-card-profiles'
           'libasound.so'
           'libbluetooth.so'
           'libfdk-aac.so'
           'libfreeaptx.so'
           'liblc3.so'
           'libldacBT_enc.so'
           'liblilv-0.so'
           'libopus.so'
           'libsbc.so'
           'libsndfile.so'
           'libusb-1.0.so'
           'libwebrtc_audio_processing.so'
           'pipewire-git'
           )
  provides=("pipewire-audio=${pkgver}")
  conflicts=('pipewire-audio')

  mv audio/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-jack-git() {
  pkgdesc+=" - JACK support (GIT version)"
  license+=('GPL2')  # libjackserver
  depends=('pipewire-session-manager'
           "libpipewire-${_ver}.so"
           'sh'
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

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/jack.conf.d"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-jack"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
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

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-alsa-git() {
  pkgdesc+=" - ALSA configuration (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libasound.so'
           'pipewire-session-manager'
          )
  backup=('usr/share/alsa/alsa.conf.d/50-pipewire.conf'
          'usr/share/alsa/alsa.conf.d/99-pipewire-default.conf'
          )
  provides=("pipewire-alsa=${pkgver}"
            'pulseaudio-alsa'
            )
  conflicts=('pipewire-alsa'
             'pulseaudio-alsa'
             )

  mv alsa/* "${pkgdir}"

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-alsa"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
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

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
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

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor (GIT version)"
  depends=("pipewire-git=${pkgver}"
           'pipewire-session-manager'
           "libpipewire-${_ver}.so"
           'sh'
           )
  provides=("pipewire-v4l2=${pkgver}")
  conflicts=('pipewire-v4l2')

  mv v4l2/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-roc-git() {
  pkgdesc+=" - ROC support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libroc.so'
           )
  provides=("pipewire-roc=${pkgver}")
  conflicts=('pipewire-roc')

  mv roc/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-libcamera-git() {
  pkgdesc+=" - libcamera support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libcamera.so'
           'libcamera-base.so'
           'gcc-libs'
           )
  provides=("pipewire-libcamera=${pkgver}")
  conflicts=('pipewire-libcamera')

  mv camera/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-x11-bell-git() {
  pkgdesc+=" - X11 bell (GIT version)"
  depends=('libcanberra.so'
           "libpipewire-${_ver}.so"
           'libxfixes'
           )
  provides=("pipewire-x11-bell=${pkgver}")
  conflicts=('pipewire-x11-bell')

  mv x11-bell/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}
