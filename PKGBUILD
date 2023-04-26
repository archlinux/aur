#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=pipewire-git
pkgname=('pipewire-git'
         'libpipewire-git'
         'pipewire-docs-git'
         'pipewire-audio-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-zeroconf-git'
         'pipewire-v4l2-git'
         'pipewire-roc-git'
         'pipewire-x11-bell-git'
         )
pkgver=0.3.70.25.g815501cc1
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('MIT')
makedepends=('git'
             'meson'
             'alsa-lib'
             'avahi'
             'bluez-libs'
             'dbus'
             'doxygen'
             'glib2'
             'graphviz'
             'ffmpeg'
             'libcamera'
             'libcanberra'
             'libfdk-aac'
             'libfreeaptx'
             'liblc3'
             'libldac'
             'libmysofa'
             'libpulse'
             'libsndfile'
             'libusb'
             'libx11'
             'libxfixes'
             'lilv'
             'ncurses'
             'opus'
             'python-docutils'
             'readline'
             'roc-toolkit'
             'rtkit'
             'sbc'
             'sdl2'
             'systemd'
             'valgrind'
             'vulkan-headers'
             'vulkan-icd-loader'
             'webrtc-audio-processing'
             'chrpath'
             )
checkdepends=('desktop-file-utils')
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
    -D pw-cat-ffmpeg=enabled \
    -D vulkan=enabled \
    -D jack-devel=true \
    -D libjack-path=/usr/lib \
    -D rlimits-install=false \
    -D session-managers=[] \
    -D bluez5-codec-lc3=enabled \
    -D bluez5-codec-lc3plus=disabled \
    -D compress-offload=enabled \
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
  depends=("libpipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'libcamera-base.so'
           'libcamera.so'
           'libcrypto.so'
           'libdbus-1.so'
           'libglib-2.0.so'
           'libncursesw.so'
           'libreadline.so'
           'libsystemd.so'
           'libvulkan.so'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-audio-git: Audio support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-session-manager: Session manager'
              'gst-plugin-pipewire-git: gstreamer support'
              'pipewire-zeroconf-git: Zeroconf support'
              'pipewire-v4l2-git: V4L2 interceptor'
              'pipewire-roc-git: ROC support'
              'pipewire-x11-bell-git: X11 bell'
              'realtime-privileges: realtime privileges with rt module'
              'rtkit: realtime privileges with rtkit module'
              )
  provides=("pipewire=${pkgver}")
  conflicts=('pipewire'
             'pipewire-libcamera-git'
             )
  backup=('usr/share/pipewire/client.conf'
          'usr/share/pipewire/client-rt.conf'
          'usr/share/pipewire/pipewire.conf'
          'usr/share/pipewire/minimal.conf'
          )
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/"{client-rt,client,minimal,pipewire}.conf.d

  rm -fr "${srcdir}"/{audio,alsa,docs,jack,pulse,roc,v4l2,x11-bell,zeroconf}

  (cd "${pkgdir}"

  _pick lib usr/include/{pipewire-${_ver},spa-0.2}
  _pick lib usr/lib/libpipewire-${_ver}.so*
  _pick lib usr/lib/pkgconfig/lib{pipewire-${_ver},spa-0.2}.pc

  _pick audio usr/bin/pipewire-{aes67,avb}
  _pick audio usr/bin/pw-{cat,play,record,midi{play,record},dsdplay}
  _pick audio usr/bin/pw-{loopback,mididump}
  _pick audio usr/bin/spa-{acp-tool,resample}
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-avb.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-echo-cancel.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-fallback-sink.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-filter-chain.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-loopback.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-pipe-tunnel.so"
  _pick audio "usr/lib/pipewire-${_ver}/libpipewire-module-protocol-simple.so"
  _pick audio "usr/lib/pipewire-${_ver}/"libpipewire-module-rtp-*.so
  _pick audio usr/lib/spa-0.2/{aec,audio*,avb,ffmpeg,bluez5,volume}
  _pick audio usr/lib/systemd/user/filter-chain.service
  _pick audio usr/share/man/man1/pw-{cat,mididump}.1
  _pick audio usr/share/pipewire/filter-chain*
  _pick audio usr/share/pipewire/pipewire-{aes67,avb}.conf
  _pick audio usr/share/spa-0.2/bluez5

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack
  _pick jack usr/include/jack
  _pick jack usr/lib/libjack*
  _pick jack usr/lib/pkgconfig/jack.pc
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1
  _pick jack usr/share/pipewire/jack.conf

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse "usr/lib/pipewire-${_ver}/libpipewire-module-protocol-pulse.so"
  _pick pulse "usr/lib/pipewire-${_ver}/libpipewire-module-pulse-tunnel.so"
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*
  _pick pulse usr/share/man/man1/pipewire-pulse.1
  _pick pulse usr/share/pipewire/pipewire-pulse.conf
  _pick pulse usr/lib/udev
  _pick pulse usr/share/alsa-card-profile

  _pick alsa usr/lib/alsa-lib
  _pick alsa usr/lib/spa-0.2/alsa
  _pick alsa usr/share/alsa

  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-zeroconf-discover.so"
  _pick zeroconf "usr/lib/pipewire-${_ver}/libpipewire-module-raop-discover.so"

  _pick v4l2 usr/bin/pw-v4l2
  _pick v4l2 "usr/lib/pipewire-${_ver}/v4l2"
  _pick v4l2 usr/lib/spa-0.2/v4l2

  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-sink.so"
  _pick roc "usr/lib/pipewire-${_ver}/libpipewire-module-roc-source.so"

  _pick x11-bell "usr/lib/pipewire-${_ver}/libpipewire-module-x11-bell.so"

  )

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-access.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-adapter.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-client-device.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-client-node.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-combine-stream.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-link-factory.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-metadata.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-portal.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-profiler.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-protocol-native.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-raop-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rt.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rtkit.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-session-manager.so"


  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_libpipewire-git() {
  pkgdesc+=" - client library (GIT Version)"
  depends=('gcc-libs'
           'glibc'
           )
  provides=("libpipewire=${pkgver}"
            "libpipewire-${_ver}.so"
            )
  conflicts=('libpipewire')

  mv lib/* "${pkgdir}"

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
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'gcc-libs'
           'glibc'
           'alsa-card-profiles'
           'libasound.so'
           'libavahi-client.so'
           'libavahi-common.so'
           'libavcodec.so'
           'libavformat.so'
           'libavutil.so'
           'libbluetooth.so'
           'libdbus-1.so'
           'libfdk-aac.so'
           'libfreeaptx.so'
           'libgio-2.0.so'
           'libglib-2.0.so=0-64'
           'libgobject-2.0.so'
           'liblc3.so'
           'libldacBT_abr.so'
           'libldacBT_enc.so'
           'liblilv-0.so'
           'libmysofa.so'
           'libopus.so'
           'libsbc.so'
           'libsndfile.so'
           'libusb-1.0.so'
           'libwebrtc_audio_processing.so'
           )
  provides=("pipewire-audio=${pkgver}")
  conflicts=('pipewire-audio'
             'pipewire-ffmpeg-git'
             )

  mv audio/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-echo-cancel.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-fallback-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-filter-chain.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-loopback.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-pipe-tunnel.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-protocol-simple.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rtp-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-rtp-source.so"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-alsa-git() {
  pkgdesc+=" - ALSA configuration (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "pipewire-audio-git=${pkgver}"
           'pipewire-session-manager'
           'glibc'
           'libasound.so'
           'libudev.so'
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

package_pipewire-jack-git() {
  pkgdesc+=" - JACK support (GIT version)"
  license+=('GPL2')  # libjackserver
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           "pipewire-audio-git=${pkgver}"
           'pipewire-session-manager'
           'glibc'
           'sh'
           )
  optdepends=('jack-example-tools: for official JACK example-clients and tools')
  provides=("pipewire-jack=${pkgver}"
            'jack2'
            'libjack.so'
            'libjackserver.so'
            'libjacknet.so'
            )
  conflicts=('pipewire-jack'
             'jack'
             'jack2'
            )
  backup=('usr/share/pipewire/jack.conf')

  mv jack/* "${pkgdir}"

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/jack.conf.d"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-jack"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-pulse-git() {
  pkgdesc+=" - PulseAudio replacement (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           "pipewire-audio-git=${pkgver}"
           'pipewire-session-manager'
           'gcc-libs'
           'glibc'
           'libavahi-client.so'
           'libavahi-common.so'
           'libdbus-1.so'
           'libgio-2.0.so'
           'libglib-2.0.so'
           'libgobject-2.0.so'
           'libpulse.so'
           'libsystemd.so'
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

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-protocol-pulse.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-pulse-tunnel.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-roc-git() {
  pkgdesc+=" - ROC support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           "pipewire-audio-git=${pkgver}"
           'glibc'
           'libroc.so'
           )
  provides=("pipewire-roc=${pkgver}")
  conflicts=('pipewire-roc')

  mv roc/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-roc-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-roc-source.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-zeroconf-git() {
  pkgdesc+=" - Zeroconf support (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'glibc'
           'libavahi-client.so'
           'libavahi-common.so'
           )
  provides=("pipewire-zeroconf=${pkgver}")
  conflicts=('pipewire-zeroconf')

  mv zeroconf/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-raop-discover.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-zeroconf-discover.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           'pipewire-session-manager'
           'glibc'
           'libudev.so'
           'sh'
           )
  provides=("pipewire-v4l2=${pkgver}")
  conflicts=('pipewire-v4l2')

  mv v4l2/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-x11-bell-git() {
  pkgdesc+=" - X11 bell (GIT version)"
  depends=("pipewire-git=${pkgver}"
           "libpipewire-${_ver}.so"
           "pipewire-audio-git=${pkgver}"
           'glibc'
           'libcanberra.so'
           'libx11'
           'libxfixes'
           )
  provides=("pipewire-x11-bell=${pkgver}")
  conflicts=('pipewire-x11-bell')

  mv x11-bell/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_ver}/libpipewire-module-x11-bell.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}
