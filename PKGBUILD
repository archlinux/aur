# Maintainer: Raul Dias <raul@dias.com.br>
#
# Arch packages of omarchy-broadcast (https://github.com/rsd/omarchy-broadcast),
# built from the latest commit of its default branch; makepkg sets pkgver
# from that commit. This file is generated from packaging/arch/PKGBUILD in
# that repository: report problems there.
#
# One build makes five packages (a split package):
#   omarchy-broadcast-git             the core: everything below that is not
#                                     a module of one of the four others
#   omarchy-broadcast-maxine-vfx-git  the NVIDIA Maxine video effects module
#                                     (needs maxine-vfx-sdk-local)
#   omarchy-broadcast-maxine-ar-git   the NVIDIA Maxine AR effects module, eye
#                                     contact (needs maxine-ar-sdk-local)
#   omarchy-broadcast-maxine-afx-git  the NVIDIA Maxine audio effects module of
#                                     the microphone (needs maxine-afx-sdk-local)
#   omarchy-broadcast-onnx-git        the open-model cut-out module (ONNX Runtime)
# A module package does not depend on one version of the core but on the
# module interface (the module ABI): the core provides
# omarchy-broadcast-module-abi=<major>.<minor>, and a module package requires
# that virtual package at the minor it was built for or later, and below the
# next major. A minor version of the interface only adds, so a newer core
# keeps running an older module; the daemon refuses a module built for a
# newer minor than its own, and a module of another major version.
#
# Build (in this directory):     makepkg -s
# Install the core with the modules wanted, for example:
#   sudo pacman -U omarchy-broadcast-git-*.pkg.tar.zst \
#     omarchy-broadcast-onnx-git-*.pkg.tar.zst
#
# The core installs the daemon, the command-line client, the systemd user
# unit, the D-Bus activation file and the documentation. The Omarchy bar
# widget is a separate project (the omarchy-broadcast-plugin repository) and
# is not part of these packages. Nothing is enabled: each user runs
#   systemctl --user enable --now omarchy-broadcastd.service
# The v4l2loopback device must be configured as in docs/setup/loopback.md;
# the core ships its modprobe.d line as an example to copy, in
# /usr/share/doc/omarchy-broadcast/examples/modprobe.d (never in
# /usr/lib/modprobe.d: one options line per module is allowed, and it would
# collide with a user's own). omarchy-broadcast.install prints these steps
# after an install of the core, and a reminder after an upgrade.
# (The docs/ files named here are installed in /usr/share/doc/omarchy-broadcast.)
#
# The NVIDIA driver userspace (nvidia-utils) and CUDA (cuda, for NVRTC) are
# optional dependencies of the core: the daemon opens them at run time.
# Without an NVIDIA GPU nothing extra is needed and the daemon runs the video
# in system memory. With an NVIDIA GPU, install cuda as well: under
# [video] memory = "auto" the daemon takes the CUDA path whenever the driver
# lists a GPU, and GStreamer's CUDA converters need libnvrtc.so from cuda
# (or set [video] memory = "system"). The Maxine video and AR module
# packages depend on cuda (their stages need the CUDA video path), and every
# Maxine SDK package depends on nvidia-utils.
#
# The daemon is built with PipeWire support (cargo feature
# omarchy-broadcastd/pipewire): it can also offer the camera as a native
# PipeWire video source, "Omarchy Broadcast". That node is off until a user
# sets [pipewire] enabled = true in config.toml (docs/config.example.toml);
# without it, or without a running PipeWire, the loopback works alone.
#
# The core also ships the optional noise-removed microphone (the PipeWire
# configurations and a template user unit), not enabled; see
# docs/setup/microphone.md. After installing a plugin package (optional
# dependencies), enable it with
#   systemctl --user enable --now omarchy-broadcast-mic@rnnoise.service
#
# The microphone with audio modules (noise removal and room echo removal) is
# in the core too, and not enabled: the mic host (omarchy-broadcast-mic.service
# with its PipeWire configuration and the forwarding plugin
# libomarchy_broadcast_mic.so in /usr/lib/ladspa), the audio worker
# (/usr/bin/omarchy-broadcast-audiod with its socket unit and D-Bus activation
# file) and the CPU voice module (DeepFilterNet and RNNoise built into the
# library, no model files). The host never loads module code; the worker
# does. Enable it with
#   systemctl --user enable --now omarchy-broadcast-mic.service
# It is the alternative to the ADR 0014 units above: run one of them.
# DeepFilterNet is a git dependency (the upstream repository, pinned by commit
# in Cargo.lock): `cargo fetch` in prepare() needs network access for it, and
# the build cannot be done offline without a prepared vendor directory.
#
# Modules are libraries in /usr/lib/omarchy-broadcast/modules, each with its
# manifest in /usr/lib/omarchy-broadcast/modules.d; the daemon (video) or the
# audio worker (audio) loads them. Without a module package the daemon simply
# does not list that module.
#
# The NVIDIA Maxine SDKs (Video Effects, AR, Audio Effects) are licensed
# separately by NVIDIA and are never part of these packages. Each comes, with
# the os-release shim it needs on distributions NVIDIA does not list, from a
# package each user builds from their own download with the
# omarchy-nvidia-sdks repository: maxine-vfx-sdk-local, maxine-ar-sdk-local
# and maxine-afx-sdk-local, a dependency of the matching module package. The
# modules load the SDK at run time. No drop-in is needed: at start, the
# daemon and the audio worker find the SDK environment those packages
# install (the maxine-*.env file and the shim beside it) and apply it to
# themselves, and log that they did (OBC_NO_SDK_ENV=1 turns this off). A
# drop-in copied by hand for an earlier version keeps working, but is no
# longer needed. Without its SDK a module reports why it cannot run.
#
# The open-model cut-out module opens ONNX Runtime (libonnxruntime.so, 1.29 or
# later) at run time. Its models are not part of this build: each is a
# package of its own, omarchy-onnx-model-<id>, from the omarchy-onnx-models
# repository (https://github.com/rsd/omarchy-onnx-models), installed in
# /usr/share/omarchy-onnx-models. The module package depends on the default
# model's package and names the others as optional dependencies.
#
# The C header of the module interface is installed in
# /usr/include/omarchy-broadcast, for modules built out of tree.
#
# A udev rule for the Logitech MX Brio (USB 046d:0944) is installed in
# /usr/lib/udev/rules.d: it tags the camera's hidraw nodes with uaccess, so
# that the user of the active local seat gets access to the node, which the
# daemon reads (read-only, only while streaming) for the Show Mode status. It
# matches no other device. Replug the camera, or run `udevadm trigger`, to
# apply it to a camera that is already connected.

pkgbase=omarchy-broadcast-git
pkgname=(
  'omarchy-broadcast-git'
  'omarchy-broadcast-maxine-vfx-git'
  'omarchy-broadcast-maxine-ar-git'
  'omarchy-broadcast-maxine-afx-git'
  'omarchy-broadcast-onnx-git'
)
_pkgname=omarchy-broadcast
pkgver=0.57.4
pkgrel=1
# The module ABI (<major>.<minor>) that the core provides and that the module
# packages require. It must equal OBC_MODULE_ABI_MAJOR.OBC_MODULE_ABI_MINOR in
# crates/obc-module-abi/include/omarchy_broadcast_module.h; the core's
# package() fails when it does not.
_module_abi=1.6
pkgdesc='GPU virtual camera daemon for v4l2loopback, with a D-Bus API and a CLI'
url='https://github.com/rsd/omarchy-broadcast'
arch=('x86_64')
# The project is MIT OR Apache-2.0. The CPU voice module statically includes
# nnnoiseless (RNNoise, BSD-3-Clause) and the daemon and the worker libloading (ISC), whose
# notices (with DeepFilterNet's) are in THIRD-PARTY-NOTICES. The module
# packages set their own.
license=('MIT OR Apache-2.0' 'BSD-3-Clause' 'ISC')
# The core's dependencies (the global ones, which makepkg -s also installs to
# build and test); each module package sets its own.
depends=(
  'libgcc'                 # libgcc_s.so.1 (split out of gcc-libs on current Arch)
  'glibc'
  'glib2'
  'gstreamer'              # libgstreamer-1.0; capsfilter, queue, filesrc, fakesink
  'gst-plugins-base-libs'  # libgstapp/libgstvideo; videoconvert(scale), videoscale, appsrc, appsink, videotestsrc
  'gst-plugins-good'       # v4l2src, v4l2sink, videocrop, jpegdec, pngdec, capssetter
  'gst-plugins-bad-libs'   # nvcodec plugin and libgstcuda: cudaupload, cudaconvert(scale), cudadownload
  'V4L2LOOPBACK-MODULE'    # the loopback kernel module, e.g. v4l2loopback-dkms
  'libpipewire'            # libpipewire-0.3.so.0: the optional PipeWire camera node
  'alsa-lib'               # libasound.so.2: the audio worker's hardware microphone gain
)
makedepends=(
  'cargo'
  'git'
  'clang'                  # bindgen (libspa-sys, pipewire-sys) for the PipeWire node
)
checkdepends=(
  'dbus'                   # /usr/bin/dbus-daemon: the process and CLI tests run a private bus
  'pipewire'               # client.conf: the PipeWire node's unit tests create a PipeWire context (no daemon)
)
# cuda and nvidia-utils are optional: nothing links against them. The daemon
# opens libcuda.so.1 and libnvidia-ml.so.1 at run time, and libgstcuda opens
# libnvrtc.so. Without an NVIDIA GPU the daemon runs the video in system
# memory (docs/setup/onnx.md, "Using it on a machine without an NVIDIA GPU");
# with one, the CUDA path needs cuda as well as nvidia-utils.
optdepends=(
  'cuda: NVRTC, needed for the CUDA video path on NVIDIA GPUs'
  'nvidia-utils: CUDA driver and NVML, needed for the CUDA video path on NVIDIA GPUs'
  'omarchy: the Omarchy shell, for the bar widget in the separate omarchy-broadcast-plugin repository'
  'v4l2loopback-utils: runtime-only loopback setup without modprobe.d'
  'pipewire: the optional PipeWire camera node ([pipewire] enabled in config.toml), the optional noise-removed microphone (ADR 0014) and the microphone host with its audio worker (omarchy-broadcast-mic.service, omarchy-broadcast-audiod)'
  'noise-suppression-for-voice: RNNoise engine for the noise-removed microphone (default)'
  'deepfilternet-ladspa: DeepFilterNet engine for the noise-removed microphone'
  'omarchy-broadcast-maxine-vfx-git: NVIDIA Maxine video effects module (background blur and replacement, video noise removal)'
  'omarchy-broadcast-maxine-ar-git: NVIDIA Maxine AR effects module (eye contact)'
  'omarchy-broadcast-maxine-afx-git: NVIDIA Maxine audio effects module for the microphone'
  'omarchy-broadcast-onnx-git: open-model cut-out module (background blur and replacement with ONNX Runtime)'
  'gst-plugins-bad: WebP background and away images (webpdec)'
  'ffmpeg: animated imports and posters of video backgrounds'
)
# No LTO: with makepkg's -flto, libspa's build script compiles its C wrapper
# into GCC LTO bitcode, which rust-lld cannot link (undefined libspa_rs_*).
options=('!lto')
source=("$_pkgname::git+https://github.com/rsd/omarchy-broadcast.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local version
  version=$(sed -n '/^\[workspace\.package\]/,/^\[/s/^version = "\(.*\)"/\1/p' Cargo.toml)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features omarchy-broadcastd/pipewire \
    -p omarchy-broadcastd -p omarchy-broadcast
  # The Maxine modules: libraries the daemon loads (no Maxine code is linked
  # into the daemon).
  cargo build --frozen --release -p obc-module-maxine -p obc-module-maxine-ar
  # The open-model cut-out module, a library the daemon loads; its own
  # invocation, for the reason given below.
  cargo build --frozen --release -p obc-module-onnx
  # The audio worker, the LADSPA forwarding plugin (libomarchy_broadcast_mic.so),
  # the CPU voice module and the Maxine audio module. A separate invocation, as
  # for the modules above:
  # one invocation unifies the features of its packages. The plugin and the
  # module are libraries the mic host's filter-chain and the worker load.
  cargo build --frozen --release \
    -p omarchy-broadcast-audiod -p obc-mic-shim -p obc-module-voice-cpu \
    -p obc-module-afx
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The default test run needs no GPU, camera or loopback device; the
  # hardware and SDK tests are ignored. A Maxine environment of the builder
  # must not leak into it (docs/testing.md). The second run adds the
  # PipeWire node's unit tests (the feature the package is built with);
  # they contact no PipeWire daemon, and the live PipeWire tests are
  # ignored.
  env -u MAXINE_VFX_ROOT -u MAXINE_AR_ROOT -u MAXINE_AFX_ROOT -u LD_LIBRARY_PATH -u LD_PRELOAD -u MAXINE_OS_RELEASE \
    cargo test --frozen --workspace
  env -u MAXINE_VFX_ROOT -u MAXINE_AR_ROOT -u MAXINE_AFX_ROOT -u LD_LIBRARY_PATH -u LD_PRELOAD -u MAXINE_OS_RELEASE \
    cargo test --frozen -p obc-pipeline -p omarchy-broadcastd --features omarchy-broadcastd/pipewire
}

package_omarchy-broadcast-git() {
  provides=("$_pkgname" "$_pkgname-module-abi=$_module_abi")
  conflicts=("$_pkgname")
  # The next steps (loopback, unit, microphone), printed by pacman.
  install=$_pkgname.install

  cd "$_pkgname"

  # The module ABI this package provides is the one of the header it ships.
  local abi_major abi_minor
  abi_major=$(sed -n 's/^#define OBC_MODULE_ABI_MAJOR \([0-9][0-9]*\)$/\1/p' \
    crates/obc-module-abi/include/omarchy_broadcast_module.h)
  abi_minor=$(sed -n 's/^#define OBC_MODULE_ABI_MINOR \([0-9][0-9]*\)$/\1/p' \
    crates/obc-module-abi/include/omarchy_broadcast_module.h)
  [[ "$abi_major.$abi_minor" == "$_module_abi" ]] ||
    { echo "_module_abi is $_module_abi, but the header says $abi_major.$abi_minor" >&2; return 1; }

  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/omarchy-broadcastd \
    target/release/omarchy-broadcast

  install -Dm644 dist/systemd/omarchy-broadcastd.service \
    "$pkgdir/usr/lib/systemd/user/omarchy-broadcastd.service"
  install -Dm644 dist/dbus-1/services/br.com.dias.OmarchyBroadcast.service \
    "$pkgdir/usr/share/dbus-1/services/br.com.dias.OmarchyBroadcast.service"

  # The audio worker, its units and its D-Bus activation file (an internal
  # interface of the daemon). Its units are inactive: the socket has no
  # [Install] section, and the worker is started by a connection or a bus call.
  install -Dm755 -t "$pkgdir/usr/bin" target/release/omarchy-broadcast-audiod
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    dist/systemd/omarchy-broadcast-audiod.service \
    dist/systemd/omarchy-broadcast-audiod.socket
  install -Dm644 \
    dist/dbus-1/services/br.com.dias.OmarchyBroadcast.AudioWorker.service \
    "$pkgdir/usr/share/dbus-1/services/br.com.dias.OmarchyBroadcast.AudioWorker.service"
  grep -qx 'ExecStart=/usr/bin/omarchy-broadcast-audiod' \
    "$pkgdir/usr/lib/systemd/user/omarchy-broadcast-audiod.service" ||
    { echo 'omarchy-broadcast-audiod.service: ExecStart is not the packaged binary' >&2; return 1; }

  # The CPU voice module (audio worker): the library, and its manifest in the
  # system modules.d directory, which names the library by absolute path. The worker loads it; the
  # daemon lists the manifest and never opens the library.
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/modules" \
    target/release/libobc_module_voice_cpu.so
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/modules.d" \
    crates/obc-module-voice-cpu/voice-cpu.toml
  grep -qx 'library = "/usr/lib/omarchy-broadcast/modules/libobc_module_voice_cpu.so"' \
    "$pkgdir/usr/lib/$_pkgname/modules.d/voice-cpu.toml" ||
    { echo 'voice-cpu.toml: the library path is not the packaged one' >&2; return 1; }

  # The C header of the module interface, for modules built out of tree.
  install -Dm644 -t "$pkgdir/usr/include/$_pkgname" \
    crates/obc-module-abi/include/omarchy_broadcast_module.h

  # The udev rule that lets the user of the active seat open the MX Brio's
  # hidraw node (the daemon reads the Show Mode from it). It sorts before
  # 73-seat-late.rules, where the uaccess tag becomes an ACL.
  install -Dm644 dist/udev/70-omarchy-broadcast-mx-brio.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-omarchy-broadcast-mx-brio.rules"

  # The project's licences, and the notices that the code statically linked
  # into the CPU voice module and the audio worker requires (nnnoiseless,
  # DeepFilterNet and its model, libloading).
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT LICENSE-APACHE \
    dist/licenses/THIRD-PARTY-NOTICES

  # The bundled background gallery (procedural images and video loops made by
  # scripts/gen-backgrounds.sh), each loop's shipped poster (<stem>.poster.jpg,
  # matched by *.jpg; the daemon copies it into its cache, so no ffmpeg is
  # needed for it) and the provenance of every file in it.
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname/media/backgrounds" \
    assets/media/backgrounds/*.jpg assets/media/backgrounds/*.webm \
    assets/media/backgrounds/SOURCES.toml

  # The bundled away images (shown in a call when the camera is off) and
  # their provenance.
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname/media/away" \
    assets/media/away/*.jpg assets/media/away/SOURCES.toml

  # Documentation, in the repository's layout so that links between the
  # shipped files resolve. Links to files that are not shipped (decision
  # records, benchmarks, tests, sources) refer to the repository.
  local doc="$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 -t "$doc" README.md
  install -Dm644 -t "$doc/docs" docs/dbus-api.md docs/cli-json.md docs/config.example.toml
  install -Dm644 -t "$doc/docs/setup" docs/setup/*.md

  # The opt-in drop-in that orders WirePlumber after the daemon, shipped
  # verbatim as an inactive example; its header says where to copy it. (The
  # Maxine SDKs need no drop-in: the daemon and the worker apply the SDK
  # environment themselves.)
  install -Dm644 -t "$doc/examples/systemd/wireplumber.service.d" \
    dist/systemd/wireplumber.service.d/omarchy-broadcast.conf

  # The loopback's modprobe.d line (docs/setup/loopback.md), as an inactive
  # example to copy into /etc/modprobe.d.
  install -Dm644 -t "$doc/examples/modprobe.d" \
    dist/modprobe.d/omarchy-broadcast.conf

  # The optional noise-removed microphone: the filter-chain configurations
  # and the template unit, inactive (docs/setup/microphone.md). The packaged
  # configurations are not on PipeWire's config search path, so the packaged
  # unit names them by absolute path: only its ExecStart= line is rewritten
  # from the repository's, which looks them up by name.
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname/pipewire" \
    dist/pipewire/omarchy-broadcast-mic-*.conf
  local mic_unit="$pkgdir/usr/lib/systemd/user/omarchy-broadcast-mic@.service"
  install -d "${mic_unit%/*}"
  sed 's|^ExecStart=/usr/bin/pipewire -c omarchy-broadcast-mic-%i\.conf$|ExecStart=/usr/bin/pipewire -c /usr/share/omarchy-broadcast/pipewire/omarchy-broadcast-mic-%i.conf|' \
    dist/systemd/omarchy-broadcast-mic@.service >"$mic_unit"
  chmod 644 "$mic_unit"
  grep -qx 'ExecStart=/usr/bin/pipewire -c /usr/share/omarchy-broadcast/pipewire/omarchy-broadcast-mic-%i.conf' "$mic_unit" ||
    { echo 'omarchy-broadcast-mic@.service: the ExecStart rewrite did not take' >&2; return 1; }

  # The microphone host of the audio modules: its configuration (beside the
  # ADR 0014 ones; the glob above matches only the "-<engine>.conf" names), the
  # LADSPA forwarding plugin where the configuration finds it by name
  # (plugin = "libomarchy_broadcast_mic" is searched in /usr/lib/ladspa), and
  # the unit, whose ExecStart= names the packaged configuration by absolute
  # path. Inactive: `systemctl --user enable --now omarchy-broadcast-mic.service`.
  install -Dm644 dist/pipewire/omarchy-broadcast-mic.conf \
    "$pkgdir/usr/share/$_pkgname/pipewire/omarchy-broadcast-mic.conf"
  grep -qx '[[:space:]]*plugin = "libomarchy_broadcast_mic"' \
    "$pkgdir/usr/share/$_pkgname/pipewire/omarchy-broadcast-mic.conf" ||
    { echo 'omarchy-broadcast-mic.conf: the plugin line is not the by-name one' >&2; return 1; }
  install -Dm755 target/release/libomarchy_broadcast_mic.so \
    "$pkgdir/usr/lib/ladspa/libomarchy_broadcast_mic.so"
  local host_unit="$pkgdir/usr/lib/systemd/user/omarchy-broadcast-mic.service"
  sed 's|^ExecStart=/usr/bin/pipewire -c omarchy-broadcast-mic\.conf$|ExecStart=/usr/bin/pipewire -c /usr/share/omarchy-broadcast/pipewire/omarchy-broadcast-mic.conf|' \
    dist/systemd/omarchy-broadcast-mic.service >"$host_unit"
  chmod 644 "$host_unit"
  grep -qx 'ExecStart=/usr/bin/pipewire -c /usr/share/omarchy-broadcast/pipewire/omarchy-broadcast-mic.conf' "$host_unit" ||
    { echo 'omarchy-broadcast-mic.service: the ExecStart rewrite did not take' >&2; return 1; }
}

# The project's licences and the third-party notices (libloading, ISC, is
# statically linked into the daemon, the worker and every module library
# of the split packages), in the current package's
# licence directory.
_install_licences() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT LICENSE-APACHE \
    dist/licenses/THIRD-PARTY-NOTICES
}

package_omarchy-broadcast-maxine-vfx-git() {
  pkgdesc='NVIDIA Maxine video effects module for omarchy-broadcast: background blur and replacement, video noise removal'
  license=('MIT OR Apache-2.0' 'ISC')
  # The module ABI range (see the header). maxine-vfx-sdk-local holds the SDK,
  # which the module loads at run time, and its environment, which the daemon
  # applies at start.
  depends=(
    "$_pkgname-module-abi>=$_module_abi"
    "$_pkgname-module-abi<2"
    'libgcc'
    'glibc'
    'cuda'                   # NVRTC for GStreamer's CUDA converters: the stages take CUDA frames
    'maxine-vfx-sdk-local'
  )
  optdepends=()
  provides=("$_pkgname-maxine-vfx")
  conflicts=("$_pkgname-maxine-vfx")

  cd "$_pkgname"
  # The library, and its manifest in the system modules.d directory (it names
  # the library by absolute path).
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/modules" \
    target/release/libobc_module_maxine.so
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/modules.d" \
    crates/obc-module-maxine/maxine-vfx.toml
  grep -qx 'library = "/usr/lib/omarchy-broadcast/modules/libobc_module_maxine.so"' \
    "$pkgdir/usr/lib/$_pkgname/modules.d/maxine-vfx.toml" ||
    { echo 'maxine-vfx.toml: the library path is not the packaged one' >&2; return 1; }
  _install_licences
}

package_omarchy-broadcast-maxine-ar-git() {
  pkgdesc='NVIDIA Maxine AR effects module for omarchy-broadcast: eye contact'
  license=('MIT OR Apache-2.0' 'ISC')
  # Likewise, with the AR SDK of maxine-ar-sdk-local.
  depends=(
    "$_pkgname-module-abi>=$_module_abi"
    "$_pkgname-module-abi<2"
    'libgcc'
    'glibc'
    'cuda'                   # NVRTC for GStreamer's CUDA converters: the stages take CUDA frames
    'maxine-ar-sdk-local'
  )
  optdepends=()
  provides=("$_pkgname-maxine-ar")
  conflicts=("$_pkgname-maxine-ar")

  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/modules" \
    target/release/libobc_module_maxine_ar.so
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/modules.d" \
    crates/obc-module-maxine-ar/maxine-ar.toml
  grep -qx 'library = "/usr/lib/omarchy-broadcast/modules/libobc_module_maxine_ar.so"' \
    "$pkgdir/usr/lib/$_pkgname/modules.d/maxine-ar.toml" ||
    { echo 'maxine-ar.toml: the library path is not the packaged one' >&2; return 1; }
  _install_licences
}

package_omarchy-broadcast-maxine-afx-git() {
  pkgdesc='NVIDIA Maxine audio effects module for the omarchy-broadcast microphone: noise and room echo removal, studio voice'
  license=('MIT OR Apache-2.0' 'ISC')
  # Likewise, with the Audio Effects SDK of maxine-afx-sdk-local, whose
  # environment the audio worker applies at start. The worker loads this
  # module; the daemon only lists its manifest.
  depends=(
    "$_pkgname-module-abi>=$_module_abi"
    "$_pkgname-module-abi<2"
    'libgcc'
    'glibc'
    'maxine-afx-sdk-local'
  )
  optdepends=()
  provides=("$_pkgname-maxine-afx")
  conflicts=("$_pkgname-maxine-afx")

  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/modules" \
    target/release/libobc_module_afx.so
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/modules.d" \
    crates/obc-module-afx/maxine-afx.toml
  grep -qx 'library = "/usr/lib/omarchy-broadcast/modules/libobc_module_afx.so"' \
    "$pkgdir/usr/lib/$_pkgname/modules.d/maxine-afx.toml" ||
    { echo 'maxine-afx.toml: the library path is not the packaged one' >&2; return 1; }
  _install_licences
}

package_omarchy-broadcast-onnx-git() {
  pkgdesc='Open-model cut-out (ONNX Runtime) module for omarchy-broadcast: background blur and replacement'
  # The module statically includes libloading (ISC). The models are packaged,
  # with their licences, by omarchy-onnx-models.
  license=('MIT OR Apache-2.0' 'ISC')
  # It is a package of its own because the ONNX Runtime variants conflict
  # with one another: the core must not pull one in.
  #
  # onnxruntime is the Arch package name, and the name every variant provides
  # (onnxruntime-cpu, -cuda, -opt-cuda, -rocm, -opt-rocm each have
  # provides=onnxruntime=1.29.0). onnxruntime-core (another repository) has
  # provides=("onnxruntime=1.29.0" 'libonnxruntime.so') and conflicts with
  # every Arch variant, so it satisfies onnxruntime>=1.29 too. The module
  # opens libonnxruntime.so at run time (nothing links against it) and needs
  # the C API of 1.29 or later. The default model (MediaPipe landscape) is a
  # dependency; the others are optional.
  depends=(
    "$_pkgname-module-abi>=$_module_abi"
    "$_pkgname-module-abi<2"
    'libgcc'
    'glibc'
    'onnxruntime>=1.29'
    'omarchy-onnx-model-mediapipe-landscape'
  )
  optdepends=(
    'onnxruntime-cpu: ONNX Runtime CPU engine, for machines without an NVIDIA GPU'
    'omarchy-onnx-model-pphumanseg-v2-mobile: the PP-HumanSeg v2 mobile model'
    'omarchy-onnx-model-pphumanseg-v2-lite: the PP-HumanSeg v2 lite model'
    'omarchy-onnx-model-modnet: the MODNet model'
    'onnxruntime-core: ONNX Runtime with the CPU engine, the base of the omarchy-onnxruntime provider packages (or any Arch onnxruntime-* variant)'
    'onnxruntime-provider-cuda: the CUDA engine (onnxruntime-provider-cuda13-<preset> from omarchy-onnxruntime; or Arch onnxruntime-opt-cuda, with cudnn)'
    'onnxruntime-provider-tensorrt: the TensorRT engine (omarchy-onnxruntime)'
    'onnxruntime-provider-openvino: the OpenVINO engines (Intel CPU, GPU, NPU; omarchy-onnxruntime)'
  )
  provides=("$_pkgname-onnx")
  conflicts=("$_pkgname-onnx")

  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/modules" \
    target/release/libobc_module_onnx.so
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/modules.d" \
    crates/obc-module-onnx/onnx.toml
  grep -qx 'library = "/usr/lib/omarchy-broadcast/modules/libobc_module_onnx.so"' \
    "$pkgdir/usr/lib/$_pkgname/modules.d/onnx.toml" ||
    { echo 'onnx.toml: the library path is not the packaged one' >&2; return 1; }
  _install_licences
}
