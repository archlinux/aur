# Maintainer: Stick <stick@stma.is>
#
# libcamera with the out-of-tree IPU6 pipeline handler from
# https://github.com/kervel/libcamera (branch ipu6-pipeline-handler).
# Wraps Intel's proprietary libcamhal and presents the camera as a real
# libcamera node, so PipeWire / Snapshot / Signal / Chromium see it
# natively, without v4l2-relayd / v4l2loopback.
#
# Hardware: tested on Dell Latitude 5470 (Alder Lake IPU6 + ov01a10).
# Closed-blob firmware (intel-ipu6-camera-bin) and out-of-tree PSYS
# kernel module (intel-ipu6-dkms-git) are required at runtime.
#
# Based on extra/libcamera (David Runge, Carl Smedstad) with the IPU6
# fork, ov01a10 patches, and udev/env additions from kervel/libcamera-ipu6.

pkgbase=libcamera-ipu6
pkgname=(
  libcamera-ipu6
  libcamera-ipu6-ipa
  libcamera-ipu6-tools
  gst-plugin-libcamera-ipu6
  python-libcamera-ipu6
)
_libcamera_ver=0.7.0
_ov01a10_iter=2
pkgver=${_libcamera_ver}+ov01a10.${_ov01a10_iter}
pkgrel=5
pkgdesc="libcamera with Intel IPU6 pipeline handler (kervel fork) and OV01A10 support"
arch=(x86_64)
url="https://github.com/kervel/libcamera"
license=(
  Apache-2.0
  CC0-1.0
  'GPL-2.0-only WITH Linux-syscall-note'
  GPL-2.0-or-later
  LGPL-2.1-or-later
  'GPL-2.0-or-later WITH Linux-syscall-note OR BSD-3-Clause'
  'GPL-2.0-or-later WITH Linux-syscall-note OR MIT'
)
makedepends=(
  cmake
  git
  glib2
  gst-plugins-base
  gtest
  intel-ipu6-camera-hal-git
  libdrm
  libjpeg-turbo
  libtiff
  libyaml
  libyuv
  meson
  pybind11
  python-jinja
  python-ply
  python-pyyaml
  qt6-base
  sdl2
  systemd
)
_commit=48748f15ad5db0358e00a1643e924f19d3f1ea10
source=(
  "git+https://github.com/kervel/libcamera.git#commit=${_commit}"
  0001-ipa-Add-OV01A10-sensor-helper.patch
  0002-ipu6-make-libcamhal-init-process-global.patch
  99-ipu6-psys.rules
  60-libcamera-ipu6.conf
  10-libcamera-ipu6-ipc.conf
  wait-libcamhal-shm.c
)
sha256sums=(
  SKIP
  '084122c975f931dd44f10155bbeec37c0b1c0dc9cad214b6960df1191f544e4e'
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd libcamera
  # camera_sensor_properties.cpp already has ov01a10 merged in this fork, so
  # only the IPA sensor helper patch is needed.
  patch -Np1 < ../0001-ipa-Add-OV01A10-sensor-helper.patch
  patch -Np1 < ../0002-ipu6-make-libcamhal-init-process-global.patch

  # The fork ships ov01a10.yaml in src/ipa/simple/data/ but its meson.build
  # only installs uncalibrated.yaml. Add ov01a10.yaml to the install list.
  sed -i "s|'uncalibrated.yaml',|'uncalibrated.yaml',\n    'ov01a10.yaml',|" \
    src/ipa/simple/data/meson.build

  # The fork has the ov01a10 sensorProps entry but is missing the
  # .sensorDelays member that became required after the entry was merged.
  # -Werror=missing-field-initializers turns this into a build failure.
  # Insert exposureDelay=2, gainDelay=2 (per Intel HAL tuning) before
  # the closing brace of the ov01a10 entry.
  python3 - <<'PY'
p = 'src/libcamera/sensor/camera_sensor_properties.cpp'
s = open(p).read()
needle = '\t\t{ "ov01a10", {'
i = s.index(needle)
end = s.index('\t\t} },', i)
patch = (
    '\t\t\t.sensorDelays = {\n'
    '\t\t\t\t.exposureDelay = 2,\n'
    '\t\t\t\t.gainDelay = 2,\n'
    '\t\t\t\t.vblankDelay = 0,\n'
    '\t\t\t\t.hblankDelay = 0\n'
    '\t\t\t},\n'
)
open(p, 'w').write(s[:end] + patch + s[end:])
PY

  printf "%s\n" "$pkgver" > .tarball-version
}

build() {
  local meson_options=(
    -D documentation=disabled
    -D pipelines=ipu6,simple,uvcvideo
    -D test=true
    -D tracing=disabled
    -D v4l2=enabled
  )
  arch-meson libcamera build "${meson_options[@]}"
  meson compile -C build

  # Tiny helper used as ExecStartPre on pipewire/wireplumber to wait for
  # GDM-released libcamhal shm before libcamhal's dlopen constructor runs.
  cc -O2 -Wall -o wait-libcamhal-shm ../wait-libcamhal-shm.c
}

check() {
  # Skip tests known to fail in unprivileged builders (need user/net namespaces).
  local tests
  tests=$(meson test -C build --list | awk '{print $3}' \
    | grep -v single_stream_test \
    | grep -v multi_stream_test \
    | grep -v memory_lifetime_test)
  # shellcheck disable=SC2086
  meson test -C build $tests
}

package_libcamera-ipu6() {
  pkgdesc+=" - main library"
  depends=(
    glibc
    gnutls
    intel-ipu6-camera-hal-git
    libcamera-ipu6-ipa
    libelf
    libgcc
    libglvnd
    libstdc++
    libunwind
    libyaml
    libyuv
    sh
    systemd-libs libudev.so
  )
  optdepends=(
    'gst-plugin-libcamera-ipu6: GStreamer plugin'
    'libcamera-ipu6-tools: applications (cam, qcam, lc-compliance)'
    'intel-ipu6-camera-bin: closed-blob firmware (.aiqb tuning files) - required at runtime'
    'intel-ipu6-dkms-git: out-of-tree intel_ipu6_psys kernel module - required at runtime'
  )
  provides=(libcamera libcamera.so libcamera-base.so)
  conflicts=(libcamera)
  replaces=(libcamera)

  meson install -C build --destdir "$pkgdir"
  install -vDm 644 libcamera/LICENSES/{BSD-3-Clause,Linux-syscall-note,MIT}.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -vDm 644 ../99-ipu6-psys.rules     "$pkgdir/usr/lib/udev/rules.d/99-ipu6-psys.rules"
  install -vDm 644 ../60-libcamera-ipu6.conf "$pkgdir/usr/lib/environment.d/60-libcamera-ipu6.conf"
  install -vDm 644 ../10-libcamera-ipu6-ipc.conf \
    "$pkgdir/usr/lib/systemd/user/pipewire.service.d/10-libcamera-ipu6-ipc.conf"
  install -vDm 644 ../10-libcamera-ipu6-ipc.conf \
    "$pkgdir/usr/lib/systemd/user/wireplumber.service.d/10-libcamera-ipu6-ipc.conf"
  install -vDm 755 wait-libcamhal-shm \
    "$pkgdir/usr/lib/libcamera-ipu6/wait-libcamhal-shm"

  (
    cd "$pkgdir"
    _pick libcamera-ipu6-ipa       usr/lib/libcamera/
    _pick libcamera-ipu6-tools     usr/bin/{cam,qcam,lc-compliance}
    _pick gst-plugin-libcamera-ipu6 usr/lib/gstreamer-*
    _pick python-libcamera-ipu6    usr/lib/python*
  )
}

package_libcamera-ipu6-ipa() {
  pkgdesc+=" - signed IPA"
  license=(
    BSD-2-Clause
    CC-BY-SA-4.0
    CC0-1.0
    GPL-2.0-or-later
    LGPL-2.1-or-later
  )
  depends=(
    glibc
    libcamera-ipu6 libcamera.so libcamera-base.so
    libgcc
    libstdc++
  )
  provides=(libcamera-ipa)
  conflicts=(libcamera-ipa)
  replaces=(libcamera-ipa)
  options=(!strip)

  strip libcamera-ipu6-ipa/usr/lib/libcamera/*{.so,proxy}
  for _lib in libcamera-ipu6-ipa/usr/lib/libcamera/*.so; do
    libcamera/src/ipa/ipa-sign.sh \
      "$(find build -type f -iname '*ipa-priv-key.pem')" \
      "$_lib" "$_lib.sign"
  done
  mv -v libcamera-ipu6-ipa/* "$pkgdir"
  install -vDm 644 libcamera/LICENSES/BSD-2-Clause.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_libcamera-ipu6-tools() {
  pkgdesc+=" - tools (cam, qcam, lc-compliance)"
  license=(
    BSD-2-Clause
    CC0-1.0
    GPL-2.0-or-later
    LGPL-2.1-or-later
  )
  depends=(
    glibc
    gtest
    libcamera-ipu6 libcamera.so libcamera-base.so
    libdrm
    libevent libevent-2.1.so libevent_pthreads-2.1.so
    libgcc
    libjpeg-turbo libjpeg.so
    libstdc++
    libtiff libtiff.so
    libyaml
    qt6-base
    sdl2
  )
  provides=(libcamera-tools)
  conflicts=(libcamera-tools)
  replaces=(libcamera-tools)

  mv -v libcamera-ipu6-tools/* "$pkgdir"
  install -vDm 644 libcamera/LICENSES/BSD-2-Clause.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gst-plugin-libcamera-ipu6() {
  pkgdesc="GStreamer plugin for libcamera (IPU6 fork)"
  license=(
    CC0-1.0
    LGPL-2.1-or-later
  )
  depends=(
    glib2 libg{lib,object}-2.0.so
    glibc
    gst-plugins-base-libs
    gstreamer
    libcamera-ipu6 libcamera.so libcamera-base.so
    libgcc
    libstdc++
  )
  provides=(gst-plugin-libcamera)
  conflicts=(gst-plugin-libcamera)
  replaces=(gst-plugin-libcamera)

  mv -v gst-plugin-libcamera-ipu6/* "$pkgdir"
}

package_python-libcamera-ipu6() {
  pkgdesc+=" - Python integration"
  license=(
    CC0-1.0
    LGPL-2.1-or-later
  )
  depends=(
    glibc
    libcamera-ipu6
    libgcc
    libstdc++
    python
  )
  provides=(python-libcamera)
  conflicts=(python-libcamera)
  replaces=(python-libcamera)

  mv -v python-libcamera-ipu6/* "$pkgdir"
}
