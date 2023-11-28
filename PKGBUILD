#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=pipewire-git
pkgname=(
  'pipewire-git'
  'libpipewire-git'
  'pipewire-docs-git'
  'pipewire-audio-git'
  'pipewire-alsa-git'
  'pipewire-jack-git'
  'pipewire-jack-client-git'
  'pipewire-ffado-git'
  'pipewire-pulse-git'
  'pipewire-roc-git'
  'pipewire-v4l2-git'
  'pipewire-x11-bell-git'
  'pipewire-zeroconf-git'
)
pkgver=1.0.0.2.g9daca346a
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('MIT')
makedepends=(
  'git'
  'meson'
  'alsa-lib'
  'avahi'
  'bluez-libs'
  'dbus'
  'doxygen'
  'glib2'
  'graphviz'
  'ffmpeg'
  'jack2'
  'libcamera'
  'libcanberra'
  'libffado'
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
checkdepends=(
  'desktop-file-utils'
  'openal'
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

  # Silence warning about limit of DOT nodes
  echo 'DOT_GRAPH_MAX_NODES = 100' >> pipewire/doc/Doxyfile.in
}

build() {
  arch-meson pipewire build \
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
    -D bluez5-codec-lc3plus=disabled \
    -D volume=enabled \
    -D selinux=disabled \
    -D man=enabled \
    -D docs=enabled

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
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

package_pipewire-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"
  _spa_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 spaversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  depends=(
    "libpipewire-git=${pkgver}" "libpipewire-${_api_ver}.so"
    'gcc-libs' #libgcc_s.so libstdc++.so
    'glibc' # libc.so
    'libcamera' 'libcamera-base.so' 'libcamera.so'
    'dbus' 'libdbus-1.so'
    'glib2' 'libglib-2.0.so'
    'ncurses' 'libncursesw.so'
    'readline' 'libreadline.so'
    'vulkan-icd-loader' 'libvulkan.so'
    'libdrm'
  )
  optdepends=(
    'pipewire-alsa-git: ALSA support'
    'pipewire-audio-git: Audio support'
    'pipewire-ffado-git: FireWire support'
    'pipewire-docs-git: Documentation'
    'pipewire-jack-git: JACK support'
    'pipewire-jack-client-git: PipeWire as JACK client'
    'pipewire-pulse-git: PulseAudio support'
    'pipewire-roc-git: ROC support'
    'pipewire-session-manager: Session manager'
    'pipewire-v4l2-git: V4L2 interceptor'
    'pipewire-x11-bell-git: X11 bell'
    'pipewire-zeroconf-git: Zeroconf support'
    'gst-plugin-pipewire-git: gstreamer support'
    'rtkit: realtime privileges with rtkit module'
  )
  provides=("pipewire=${pkgver}")
  conflicts=(
    'pipewire'
    'pipewire-libcamera-git'
  )
  backup=(
    'usr/share/pipewire/pipewire.conf'
    'usr/share/pipewire/minimal.conf'
  )
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  rm -fr "${srcdir}"/{libs,audio,alsa,docs,jack,jack-client,pulse,roc,v4l2,x11-bell,zeroconf}

  (
  cd "${pkgdir}"
  _pick libs "usr/include/pipewire-${_api_ver}"
  _pick libs "usr/include/spa-${_spa_ver}"
  _pick libs "usr/lib/libpipewire-${_api_ver}".so*
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-metadata.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-client-node.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-client-device.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-native.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-adapter.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-session-manager.so"
  _pick libs "usr/lib/pipewire-${_api_ver}/libpipewire-module-rt.so"
  _pick libs "usr/lib/spa-${_spa_ver}/audioconvert"
  _pick libs "usr/lib/spa-${_spa_ver}/support"
  _pick libs "usr/lib/pkgconfig/libpipewire-${_api_ver}.pc"
  _pick libs "usr/lib/pkgconfig/libspa-${_spa_ver}.pc"
  _pick libs usr/share/pipewire/client.conf
  _pick libs usr/share/pipewire/client.conf.avail/20-upmix.conf
  _pick libs usr/share/pipewire/client-rt.conf
  _pick libs usr/share/pipewire/client-rt.conf.avail/20-upmix.conf
  _pick libs usr/share/man/man7/libpipewire-module-metadata.7
  _pick libs usr/share/man/man7/libpipewire-module-client-node.7
  _pick libs usr/share/man/man7/libpipewire-module-client-device.7
  _pick libs usr/share/man/man7/libpipewire-module-protocol-native.7
  _pick libs usr/share/man/man7/libpipewire-module-adapter.7
  _pick libs usr/share/man/man7/libpipewire-module-session-manager.7
  _pick libs usr/share/man/man7/libpipewire-module-rt.7
  _pick libs usr/share/man/man7/libpipewire-modules.7

  _pick audio usr/bin/pipewire-aes67
  _pick audio usr/bin/pipewire-avb
  _pick audio usr/bin/pw-cat
  _pick audio usr/bin/pw-dsdplay
  _pick audio usr/bin/pw-encplay
  _pick audio usr/bin/pw-loopback
  _pick audio usr/bin/pw-mididump
  _pick audio usr/bin/pw-midiplay
  _pick audio usr/bin/pw-midirecord
  _pick audio usr/bin/pw-play
  _pick audio usr/bin/pw-record
  _pick audio usr/bin/spa-acp-tool
  _pick audio usr/bin/spa-resample
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-avb.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-echo-cancel.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-fallback-sink.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain-sofa.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain-lv2.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-loopback.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-pipe-tunnel.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-simple.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-sap.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-sink.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-source.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-vban-recv.so"
  _pick audio "usr/lib/pipewire-${_api_ver}/libpipewire-module-vban-send.so"
  _pick audio "usr/lib/spa-${_spa_ver}/aec"
  _pick audio "usr/lib/spa-${_spa_ver}/audiomixer"
  _pick audio "usr/lib/spa-${_spa_ver}/audiotestsrc"
  _pick audio "usr/lib/spa-${_spa_ver}/avb"
  _pick audio "usr/lib/spa-${_spa_ver}/bluez5"
  _pick audio "usr/lib/spa-${_spa_ver}/ffmpeg"
  _pick audio "usr/lib/spa-${_spa_ver}/volume"
  _pick audio usr/lib/systemd/user/filter-chain.service
  _pick audio usr/share/man/man1/pw-cat.1
  _pick audio usr/share/man/man1/pw-loopback.1
  _pick audio usr/share/man/man1/pw-mididump.1
  _pick audio usr/share/man/man7/libpipewire-module-avb.7
  _pick audio usr/share/man/man7/libpipewire-module-echo-cancel.7
  _pick audio usr/share/man/man7/libpipewire-module-fallback-sink.7
  _pick audio usr/share/man/man7/libpipewire-module-filter-chain.7
  _pick audio usr/share/man/man7/libpipewire-module-loopback.7
  _pick audio usr/share/man/man7/libpipewire-module-pipe-tunnel.7
  _pick audio usr/share/man/man7/libpipewire-module-protocol-simple.7
  _pick audio usr/share/man/man7/libpipewire-module-rtp-sap.7
  _pick audio usr/share/man/man7/libpipewire-module-rtp-sink.7
  _pick audio usr/share/man/man7/libpipewire-module-rtp-source.7
  _pick audio usr/share/man/man7/libpipewire-module-vban-recv.7
  _pick audio usr/share/man/man7/libpipewire-module-vban-send.7
  _pick audio usr/share/pipewire/filter-chain.conf
  _pick audio usr/share/pipewire/filter-chain
  _pick audio usr/share/pipewire/pipewire-aes67.conf
  _pick audio usr/share/pipewire/pipewire-avb.conf
  _pick audio "usr/share/spa-${_spa_ver}/bluez5"

  _pick ffado "usr/lib/pipewire-${_api_ver}/libpipewire-module-ffado-driver.so"
  _pick ffado usr/share/man/man7/libpipewire-module-ffado-driver.7

  _pick docs usr/share/doc

  _pick jack-client "usr/lib/pipewire-${_api_ver}/libpipewire-module-jack-tunnel.so"
  _pick jack-client "usr/lib/pipewire-${_api_ver}/libpipewire-module-jackdbus-detect.so"
  _pick jack-client "usr/lib/spa-${_spa_ver}/jack"
  _pick jack-client usr/share/man/man7/libpipewire-module-jack-tunnel.7
  _pick jack-client usr/share/man/man7/libpipewire-module-jackdbus-detect.7

  _pick jack usr/bin/pw-jack
  _pick jack usr/include/jack
  _pick jack usr/lib/libjack*
  _pick jack "usr/lib/pipewire-${_api_ver}/libpipewire-module-netjack2-driver.so"
  _pick jack "usr/lib/pipewire-${_api_ver}/libpipewire-module-netjack2-manager.so"
  _pick jack usr/lib/pkgconfig/jack.pc
  _pick jack usr/share/man/man1/pw-jack.1
  _pick jack usr/share/man/man7/libpipewire-module-netjack2-driver.7
  _pick jack usr/share/man/man7/libpipewire-module-netjack2-manager.7
  _pick jack usr/share/pipewire/jack.conf

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse "usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-pulse.so"
  _pick pulse "usr/lib/pipewire-${_api_ver}/libpipewire-module-pulse-tunnel.so"
  _pick pulse usr/lib/systemd/user/pipewire-pulse.socket
  _pick pulse usr/lib/systemd/user/pipewire-pulse.service
  _pick pulse usr/share/man/man7/libpipewire-module-protocol-pulse.7
  _pick pulse usr/share/man/man7/libpipewire-module-pulse-tunnel.7
  _pick pulse usr/share/man/man1/pipewire-pulse.1
  _pick pulse usr/share/man/man5/pipewire-pulse.conf.5
  _pick pulse usr/share/man/man7/pipewire-pulse-modules.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-alsa-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-alsa-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-always-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-combine-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-echo-cancel.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-gsettings.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-jackdbus-detect.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-ladspa-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-ladspa-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-loopback.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-native-protocol-tcp.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-null-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-pipe-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-pipe-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-raop-discover.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-remap-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-remap-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-roc-sink-input.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-roc-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-roc-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-rtp-recv.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-rtp-send.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-simple-protocol-tcp.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-switch-on-connect.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-tunnel-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-tunnel-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-virtual-sink.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-virtual-source.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-x11-bell.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-zeroconf-discover.7
  _pick pulse usr/share/man/man7/pipewire-pulse-module-zeroconf-publish.7
  _pick pulse usr/share/pipewire/pipewire-pulse.conf
  _pick pulse usr/lib/udev
  _pick pulse usr/share/alsa-card-profile

  _pick alsa usr/lib/alsa-lib
  _pick alsa "usr/lib/spa-${_spa_ver}/alsa"
  _pick alsa usr/share/alsa

  _pick zeroconf "usr/lib/pipewire-${_api_ver}/libpipewire-module-zeroconf-discover.so"
  _pick zeroconf "usr/lib/pipewire-${_api_ver}/libpipewire-module-raop-discover.so"
  _pick zeroconf "usr/lib/pipewire-${_api_ver}/libpipewire-module-raop-sink.so"
  _pick zeroconf "usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-session.so"
  _pick zeroconf usr/share/man/man7/libpipewire-module-zeroconf-discover.7
  _pick zeroconf usr/share/man/man7/libpipewire-module-raop-discover.7
  _pick zeroconf usr/share/man/man7/libpipewire-module-raop-sink.7
  _pick zeroconf usr/share/man/man7/libpipewire-module-rtp-session.7

  _pick v4l2 usr/bin/pw-v4l2
  _pick v4l2 "usr/lib/pipewire-${_api_ver}/v4l2"
  _pick v4l2 "usr/lib/spa-${_spa_ver}/v4l2"

  _pick roc "usr/lib/pipewire-${_api_ver}/libpipewire-module-roc-sink.so"
  _pick roc "usr/lib/pipewire-${_api_ver}/libpipewire-module-roc-source.so"
  _pick roc usr/share/man/man7/libpipewire-module-roc-sink.7
  _pick roc usr/share/man/man7/libpipewire-module-roc-source.7

  _pick x11-bell "usr/lib/pipewire-${_api_ver}/libpipewire-module-x11-bell.so"
  _pick x11-bell usr/share/man/man7/libpipewire-module-x11-bell.7

  )

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-access.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-combine-stream.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-link-factory.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-portal.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-profiler.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rtkit.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-spa-device-factory.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-spa-device.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-spa-node-factory.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-spa-node.so"

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/pipewire.conf.d"
  mkdir -p "${pkgdir}/etc/pipewire/minimal.conf.d"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_libpipewire-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - client library"
  depends=(
    'gcc-libs' # libgcc_s.so
    'glibc' # libc.so
    'dbus' 'libdbus-1.so'
    'systemd-libs' 'libsystemd.so'
  )
  optdepends=('realtime-privileges: realtime privileges with rt module')
  provides=("libpipewire=${pkgver}" "libpipewire-${_api_ver}.so")
  conflicts=('libpipewire')
  backup=(
    'usr/share/pipewire/client.conf'
    'usr/share/pipewire/client.conf.avail/20-upmix.conf'
    'usr/share/pipewire/client-rt.conf'
    'usr/share/pipewire/client-rt.conf.avail/20-upmix.conf'
  )

  mv libs/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-metadata.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-client-node.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-client-device.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-native.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-adapter.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-session-manager.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rt.so"

  mkdir -p "${pkgdir}/etc/pipewire/client.conf.d"
  mkdir -p "${pkgdir}/etc/pipewire/client-rt.conf.d"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-docs-git() {
  pkgdesc+=" - documentation"
  provides=("pipewire-docs=${pkgver}")
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-audio-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - Audio support"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # libc.so
    'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
    'alsa-card-profiles'
    'alsa-lib' 'libasound.so'
    'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
    'bluez-libs' 'libbluetooth.so'
    'dbus' 'libdbus-1.so'
    'libfdk-aac' 'libfdk-aac.so'
    'libfreeaptx' 'libfreeaptx.so'
    'liblc3' 'liblc3.so'
    'libldac' 'libldacBT_abr.so' 'libldacBT_enc.so'
    'lilv' 'liblilv-0.so'
    'libmysofa' 'libmysofa.so'
    'opus' 'libopus.so'
    'sbc' 'libsbc.so'
    'libsndfile' 'libsndfile.so'
    'libusb' 'libusb-1.0.so'
    'webrtc-audio-processing' 'libwebrtc_audio_processing.so'
  )
  provides=("pipewire-audio=${pkgver}")
  conflicts=(
    'pipewire-audio'
    'pipewire-ffmpeg-git'
  )

  mv audio/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-avb.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-echo-cancel.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-fallback-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain-sofa.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-filter-chain-lv2.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-loopback.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-pipe-tunnel.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-simple.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-sap.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-source.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-vban-recv.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-vban-send.so"

  install -Dt "$pkgdir/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

package_pipewire-alsa-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - ALSA configuration"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'pipewire-session-manager'
    'gcc-libs' # ibgcc_s.so
    'glibc' # libc.so  libm.so
    'alsa-lib' 'libasound.so'
    'systemd-libs' 'libudev.so'
  )
  backup=(
    'usr/share/alsa/alsa.conf.d/50-pipewire.conf'
    'usr/share/alsa/alsa.conf.d/99-pipewire-default.conf'
  )
  provides=(
    "pipewire-alsa=${pkgver}"
    'pulseaudio-alsa'
  )
  conflicts=(
    'pipewire-alsa'
    'pulseaudio-alsa'
  )

  mv alsa/* "${pkgdir}"

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/{50-pipewire,99-pipewire-default}.conf

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-alsa"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-ffado-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - FireWire support"
  depends=(
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-git=${pkgver}"
    "pipewire-audio-git=${pkgver}"
    'glibc' # libc.so
    'libffado' 'libffado.so'
  )

  mv ffado/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-ffado-driver.so"

  install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-jack-client-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - PipeWire as JACK client"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'glibc' # libc.so
    'dbus' 'libdbus-1.so'
    'jack2' 'libjack.so'
  )
  conflicts=('pipewire-jack')
  provides=('pipewire-jack')

  mv jack-client/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-jack-tunnel.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-jackdbus-detect.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-jack-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - JACK replacement"
  license+=('GPL2')  # libjackserver
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'pipewire-session-manager'
    'glibc' # ld-linux-x86-64.so libc.so libm.so
    'sh'
    'opus' 'libopus.so'
  )
  optdepends=('jack-example-tools: for official JACK example-clients and tools')
  provides=(
    'pipewire-jack-client'
    "pipewire-jack=${pkgver}"
    'jack' 'libjack.so' 'libjackserver.so' 'libjacknet.so'
    'jack2'
  )
  conflicts=(
    'pipewire-jack-client'
    'pipewire-jack'
    'jack'
    'jack2'
  )
  backup=('usr/share/pipewire/jack.conf')

  mv jack/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-netjack2-driver.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-netjack2-manager.so"

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/jack.conf.d"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-jack"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-pulse-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - PulseAudio replacement"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'pipewire-session-manager'
    'gcc-libs' # libgcc_s.so
    'glibc' # libc.so libm.so
    'avahi' 'libavahi-client.so' 'libavahi-common.so'
    'dbus' 'libdbus-1.so'
    'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
    'libpulse' 'libpulse.so'
    'systemd-libs' 'libsystemd.so'
  )
  backup=('usr/share/pipewire/pipewire-pulse.conf')
  provides=(
    "pipewire-pulse=${pkgver}"
    'pulseaudio'
    'pulseaudio-bluetooth'
    'alsa-card-profiles'
  )
  conflicts=(
    'pipewire-pulse'
    'pulseaudio'
    'pulseaudio-bluetooth'
    'alsa-card-profiles'
  )
  install=pipewire-pulse.install

  mv pulse/* "${pkgdir}"

  # directories for overrides
  mkdir -p "${pkgdir}/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null "${pkgdir}/usr/share/pipewire/media-session.d/with-pulseaudio"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-protocol-pulse.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-pulse-tunnel.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-roc-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - ROC support"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'gcc-libs' # libgcc_s.so
    'glibc' # libc.so
    'roc-toolkit' 'libroc.so'
  )
  provides=("pipewire-roc=${pkgver}")
  conflicts=('pipewire-roc')

  mv roc/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-roc-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-roc-source.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-v4l2-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - V4L2 interceptor"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    'pipewire-session-manager'
    'glibc' # libc.so
    'systemd-libs' 'libudev.so'
    'sh'
  )
  provides=("pipewire-v4l2=${pkgver}")
  conflicts=('pipewire-v4l2')

  mv v4l2/* "${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-x11-bell-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - X11 bell"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'glibc' # ibc.so
    'libcanberra' 'libcanberra.so'
    'libx11' # libX11.so
    'libxfixes' # libXfixes.so
  )
  provides=("pipewire-x11-bell=${pkgver}")
  conflicts=('pipewire-x11-bell')

  mv x11-bell/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-x11-bell.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}

package_pipewire-zeroconf-git() {

  _api_ver="$(cat ${srcdir}/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"

  pkgdesc+=" - Zeroconf support"
  depends=(
    "pipewire-git=${pkgver}"
    "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
    "pipewire-audio-git=${pkgver}"
    'gcc-libs' # libgcc_s.so
    'glibc' # libc.so libm.so
    'openssl' 'libcrypto.so'
    'avahi' 'libavahi-client.so' 'libavahi-common.so'
    'opus' 'libopus.so'
  )
  provides=("pipewire-zeroconf=${pkgver}")
  conflicts=('pipewire-zeroconf')

  mv zeroconf/* "${pkgdir}"

  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-zeroconf-discover.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-raop-discover.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-raop-sink.so"
  chrpath -d "${pkgdir}/usr/lib/pipewire-${_api_ver}/libpipewire-module-rtp-session.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" pipewire/COPYING
}
