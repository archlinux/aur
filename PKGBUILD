#!/bin/env bash
# shellcheck disable=SC2034,SC2128,SC2154,SC2155,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

_upstream="$(curl -s 'https://gitlab.archlinux.org/archlinux/packaging/packages/pipewire/-/raw/main/PKGBUILD')"
_extract() {
  local var="${1}"
  awk -v var="$var" '
    $0 ~ "^" var "=" {
      print
      # If line ends with ( but not ), keep reading until we find closing )
      if ($0 ~ /\($/ && $0 !~ /\)$/) {
        while (getline > 0) {
          print
          if ($0 ~ /\)/) break
        }
      }
      exit
    }
  ' <<< "$_upstream"
}
eval "$(_extract pkgver)"
eval "$(_extract pkgrel)"
eval "$(_extract pkgdesc)"
eval "$(_extract url)"
eval "$(_extract arch)"
eval "$(_extract license)"
eval "$(_extract makedepends)"
eval "$(_extract checkdepends)"
eval "$(_extract source)"
eval "$(_extract b2sums)"
eval "$(_extract _pwname)"
eval "$(_extract _spaname)"
pkgname='pipewire-selinux'
pkgdesc+=' (SELinux-aware)'
provides=("pipewire=${pkgver}")
conflicts=('pipewire')
makedepends+=('libselinux')
license+=(
  # libspa-alsa
  LGPL-2.1-or-later
)
depends=(
  "libpipewire=${pkgver}" "libpipewire-${_api_ver}.so"
  'dbus' 'libdbus-1.so'
  'ffmpeg' 'libavcodec.so' 'libavutil.so' 'libswscale.so'
  'glib2' 'libglib-2.0.so'
  'glibc'
  'libdrm'
  'libgcc'
  'ncurses' 'libncursesw.so'
  'readline' 'libreadline.so'
  'systemd-libs' 'libsystemd.so' 'libudev.so'
)
optdepends=(
  'gst-plugin-pipewire: gstreamer support'
  'pipewire-alsa: ALSA support'
  'pipewire-audio: Audio support'
  'pipewire-docs: Documentation'
  'pipewire-ffado: FireWire support'
  'pipewire-jack: JACK support'
  'pipewire-jack-client: PipeWire as JACK client'
  'pipewire-libcamera: Libcamera support'
  'pipewire-pulse: PulseAudio support'
  'pipewire-roc: ROC support'
  'pipewire-session-manager: Session manager'
  'pipewire-v4l2: V4L2 interceptor'
  'pipewire-vulkan: Vulkan support'
  'pipewire-x11-bell: X11 bell'
  'pipewire-zeroconf: Zeroconf support'
  'realtime-privileges: realtime privileges with rt module'
  'rtkit: realtime privileges with rtkit module'
)
provides=("pipewire=${pkgver}")
conflicts=(
  'pipewire'
)
backup=(
  'usr/share/pipewire/pipewire.conf'
  'usr/share/pipewire/minimal.conf'
)
install=pipewire-selinux.install

pkgver() {
  cd pipewire
  #echo "$(git describe --long --tags | tr - .)"
  _ver="$(cat meson.build | grep -m1 'version :' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  mkdir -p build-selinux

  # Silence warning about limit of DOT nodes
  echo 'DOT_GRAPH_MAX_NODES = 100' >> pipewire/doc/Doxyfile.in

  export _api_ver="$(cat "${srcdir}"/pipewire/meson.build | grep -m1 apiversion | grep -o "[[:digit:]]*" | paste -sd'.')"
  export _spa_ver="$(cat "${srcdir}"/pipewire/meson.build | grep -m1 spaversion | grep -o "[[:digit:]]*" | paste -sd'.')"
}

build() {
  local meson_options=(
    -D bluez5-codec-lc3plus='disabled'
    -D bluez5-codec-ldac-dec='disabled'
    -D docs='enabled'
    -D jack-devel='true'
    -D libjack-path='/usr/lib'
    -D man='enabled'
    -D rlimits-install='false'
    -D selinux='enabled'
    -D session-managers='[]'
    -D snap='disabled'
    -D udevrulesdir='/usr/lib/udev/rules.d'
  )

  meson compile -C build "${meson_options[@]}" -D selinux='enabled'
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build-selinux

  (
    cd "${pkgdir}"

    # Replace copies with symlinks
    for _f in pipewire-{aes67,avb,pulse}; do
      cmp usr/bin/pipewire usr/bin/"${_f}"
      ln -sf pipewire usr/bin/"${_f}"
    done

    rm -rf /usr/include/{"${_pwname}","${_spaname}"}
    rm -rf /usr/lib/"${_spaname}"/libspa.so*
    rm -rf /usr/lib/lib"${_pwname}".so*
    rm -rf /usr/lib/pkgconfig/lib{"${_pwname}","${_spaname}"}.pc

    rm -rf /usr/lib/udev
    rm -rf /usr/share/alsa-card-profile

    rm -rf /usr/share/doc

    rm -rf /usr/lib/"${_spaname}"/libcamera

    rm -rf /usr/lib/"${_spaname}"/filter-graph/libspa-filter-graph-plugin-onnx.so

    rm -rf /usr/bin/pipewire-{aes67,avb}
    rm -rf /usr/bin/pw-{cat,loopback,mididump,midi2play,midi2record,sysex}
    rm -rf /usr/bin/pw-{dsd,enc,midi,}play
    rm -rf /usr/bin/pw-{midi,}record
    rm -rf /usr/bin/spa-{acp-tool,resample}
    rm -rf /usr/lib/alsa-lib
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-avb.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-echo-cancel.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-fallback-sink.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-filter-chain*.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-loopback.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-netjack2*.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-parametric-equalizer.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-pipe-tunnel.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-protocol-simple.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-rtp-{sap,sink,source}.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-vban*.so
    rm -rf /usr/lib/"${_spaname}"/{aec,alsa,audio*,avb,bluez5,filter-graph}
    rm -rf /usr/lib/systemd/user/filter-chain.service
    rm -rf /usr/share/alsa
    rm -rf /usr/share/man/man1/pw-{cat,loopback,mididump}.1
    rm -rf /usr/share/man/man1/spa-{acp-tool,resample}.1
    rm -rf /usr/share/man/man5/pipewire-filter-chain.conf.5
    rm -rf /usr/share/man/man7/libpipewire-module-avb.7
    rm -rf /usr/share/man/man7/libpipewire-module-echo-cancel.7
    rm -rf /usr/share/man/man7/libpipewire-module-fallback-sink.7
    rm -rf /usr/share/man/man7/libpipewire-module-filter-chain*.7
    rm -rf /usr/share/man/man7/libpipewire-module-loopback.7
    rm -rf /usr/share/man/man7/libpipewire-module-netjack2*.7
    rm -rf /usr/share/man/man7/libpipewire-module-parametric-equalizer.7
    rm -rf /usr/share/man/man7/libpipewire-module-pipe-tunnel.7
    rm -rf /usr/share/man/man7/libpipewire-module-protocol-simple.7
    rm -rf /usr/share/man/man7/libpipewire-module-rtp-{sap,sink,source}.7
    rm -rf /usr/share/man/man7/libpipewire-module-vban*.7
    rm -rf /usr/share/pipewire/filter-chain*
    rm -rf /usr/share/pipewire/pipewire-{aes67,avb}.conf
    rm -rf /usr/share/"${_spaname}"/bluez5

    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-ffado*.so
    rm -rf /usr/share/man/man7/libpipewire-module-ffado-driver.7

    rm -rf usr/lib/"${_pwname}"/libpipewire-module-jack{-tunnel,dbus-detect}.so
    rm -rf usr/lib/"${_spaname}"/jack
    rm -rf usr/share/man/man7/libpipewire-module-jack{-tunnel,dbus-detect}.7

    rm -rf /usr/bin/pw-jack
    rm -rf /usr/include/jack
    rm -rf /usr/lib/libjack*
    rm -rf /usr/lib/pkgconfig/jack*.pc
    rm -rf /usr/share/man/man1/pw-jack.1
    rm -rf /usr/share/man/man5/pipewire-jack.conf.5
    rm -rf /usr/share/pipewire/jack.conf

    rm -rf /usr/bin/pipewire-pulse
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-protocol-pulse.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-pulse-tunnel.so
    rm -rf /usr/lib/systemd/user/pipewire-pulse.*
    rm -rf /usr/share/glib-2.0/schemas/org.freedesktop.pulseaudio.gschema.xml
    rm -rf /usr/share/man/man1/pipewire-pulse.1
    rm -rf /usr/share/man/man5/pipewire-pulse.conf.5
    rm -rf /usr/share/man/man7/libpipewire-module-{protocol-pulse,pulse-tunnel}.7
    rm -rf /usr/share/man/man7/pipewire-pulse*.7
    rm -rf /usr/share/pipewire/pipewire-pulse.conf

    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-roc*.so
    rm -rf /usr/share/man/man7/libpipewire-module-roc-{sink,source}.7

    rm -rf /usr/lib/gstreamer-1.0

    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-{raop,zeroconf}-*.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-rtp-session.so
    rm -rf /usr/lib/"${_pwname}"/libpipewire-module-snapcast-discover.so
    rm -rf /usr/share/man/man7/libpipewire-module-{raop,zeroconf}-*.7
    rm -rf /usr/share/man/man7/libpipewire-module-rtp-session.7
    rm -rf /usr/share/man/man7/libpipewire-module-snapcast-discover.7

    rm -rf /usr/bin/pw-v4l2 usr/lib/"${_pwname}"/v4l2
    rm -rf /usr/share/man/man1/pw-v4l2.1

    _pick x11-bell usr/lib/"${_pwname}"/libpipewire-module-x11-bell.so
    _pick x11-bell usr/share/man/man7/libpipewire-module-x11-bell.7

    # directories for overrides
    mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire}.conf.d
  )

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 pipewire/COPYING
}

# vim:set sw=2 sts=-1 et:
