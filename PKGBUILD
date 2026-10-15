# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux (pre-built binaries)"
arch=('x86_64' 'aarch64')
url="https://voxtype.io"
license=('MIT')
depends=(
    'alsa-lib'
    'curl'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: clipboard support'
    'libnotify: desktop notifications'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'vulkan-icd-loader: GPU acceleration via Vulkan for Whisper (enable with: voxtype setup gpu --enable)'
    'cuda: GPU acceleration via CUDA 13 for ONNX engines (NVIDIA GPUs, requires driver 580+)'
    'cuda12.6: GPU acceleration via CUDA 12 for ONNX engines (older NVIDIA setups)'
    'rocm-hip-runtime: ROCm runtime (required by migraphx)'
    'migraphx: AMD GPU graph optimization for the MIGraphX execution provider — required for AMD GPU acceleration on ONNX engines'
    'ollama: local AI summarization for meeting mode'
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
    'quickshell: Quickshell-based OSD frontend (opt in via [osd] frontend = "quickshell")'
)
# aarch64 has no GPU-accelerated binary variant yet (#547 tracks it) — no
# mainstream consumer arm64 Vulkan/CUDA/ROCm hardware to build and test
# against. Don't advertise optdepends that can't do anything on this arch.
optdepends_aarch64=(
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: clipboard support'
    'libnotify: desktop notifications'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'ollama: local AI summarization for meeting mode'
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
    'quickshell: Quickshell-based OSD frontend (opt in via [osd] frontend = "quickshell")'
)
provides=('voxtype')
conflicts=('voxtype')
backup=('etc/voxtype/config.toml')
install=voxtype-bin.install
validpgpkeys=(
    # Peter Jackson's offline maintainer primary. Signed binary .asc files
    # through v0.7.4 (and was used to cross-sign the CI signing primary
    # below). Existing voxtype-bin users have this key in their local
    # keyring from v0.6.x installs — keep listed so old assets verify.
    'E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6'
    # Voxtype CI release signing primary (cross-signed by E79F5BAF...).
    # Lives in CI secrets; signs .deb / .rpm / source-archive .asc starting
    # in v0.7.5. Auto-fetchable by fingerprint from public keyservers, so
    # makepkg verifies cleanly on first install without manual gpg --recv-keys.
    '9CCF7915B750CAE8B095ED1AA3FC9F33FD209279'
)
_github="https://github.com/peteonrails/voxtype/releases/download/v$pkgver"

# Architecture-independent files: config, service unit, shell completions,
# license, docs, desktop entry + launcher, and the signed source archive
# (Quickshell QML tree + OSD style/recipe examples, identical on every arch).
source=(
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/README.md"
    # Desktop entry + terminal launcher for `voxtype configure` (TUI surfaced in walker/rofi/etc.)
    "voxtype-configure-$pkgver.desktop::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/voxtype-configure.desktop"
    "voxtype-configure-launcher-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/scripts/voxtype-configure-launcher"
    # Quickshell QML tree, copied wholesale from the signed source archive.
    # Hand-listing individual QML files here is how #488, #697, and #762
    # happened: scripts/package.sh tars the whole quickshell/ directory, so
    # deb and rpm never drifted, while this PKGBUILD's enumeration silently
    # fell behind three times. The auto-generated GitHub archive is signed
    # byte-for-byte by CI (see the #415 post-mortem above), so we verify it
    # like every binary.
    "voxtype-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz"
    "voxtype-$pkgver.tar.gz.asc::$_github/voxtype-$pkgver.tar.gz.asc"
)
sha256sums=(
    '723366abc62488a25514dc9677e53ef0d2de2be7a42aa425707458b4117647ca'  # config/default.toml
    '531c3658e229619e56bb01659fb81f401767b85e1d6e2acd1ac67ee3414a168c'  # voxtype.service
    '65c95805d9b03ccc2fadb9d63a03ab79974b00091df8457ee8ef290ec6bd5b12'  # voxtype.bash
    'e5e63b3c7f48238cf719e4f2ef90c1f9c5c7e8cd25eaebc9f78bdd34b24b6605'  # voxtype.zsh
    'f720ddd24ee97c105b448323899c36bca7c63d00c2d42c4a3da70c3d157dccbb'  # voxtype.fish
    '31123c45b4ff9cb5fd9e01083350fea6ccaf14969013fd48e4c95fdf89e6eb4b'  # LICENSE
    'b06ee68e1305174a4f66876750f62d4048d0ebee48e15ee525961a54115ff80d'  # README.md
    '32144a4a5210092b0aa909f6de7a43ebe8bbf82fa3dfb1f3519787512fdf8e4b'  # voxtype-configure.desktop
    '044b1f7b52cc610ce57ba624111d882029b0ce4bc3e2c2c360f96d07f69e0e85'  # voxtype-configure-launcher
    'dbde68a335ae190aec4f077e1b653f5fef3ff9dc7cddbfce1befae090eea33c9'  # voxtype-$pkgver.tar.gz (source archive)
    'SKIP'  # voxtype-$pkgver.tar.gz.asc
)

# x86_64: full binary set (baseline / AVX2 / AVX-512 / Vulkan Whisper,
# ONNX AVX2 / AVX-512 / CUDA-12 / CUDA-13 / MIGraphX, plus the x86_64 OSD
# binaries and audio-bridge sidecar).
source_x86_64=(
    # Whisper binaries
    # baseline: x86-64-v2, for pre-AVX2 CPUs (#612). New in 1.1.0.
    "voxtype-$pkgver-baseline::$_github/voxtype-$pkgver-linux-x86_64-baseline"
    "voxtype-$pkgver-baseline.asc::$_github/voxtype-$pkgver-linux-x86_64-baseline.asc"
    "voxtype-$pkgver-avx2::$_github/voxtype-$pkgver-linux-x86_64-avx2"
    "voxtype-$pkgver-avx2.asc::$_github/voxtype-$pkgver-linux-x86_64-avx2.asc"
    "voxtype-$pkgver-avx512::$_github/voxtype-$pkgver-linux-x86_64-avx512"
    "voxtype-$pkgver-avx512.asc::$_github/voxtype-$pkgver-linux-x86_64-avx512.asc"
    "voxtype-$pkgver-vulkan::$_github/voxtype-$pkgver-linux-x86_64-vulkan"
    "voxtype-$pkgver-vulkan.asc::$_github/voxtype-$pkgver-linux-x86_64-vulkan.asc"
    # ONNX CPU binaries (all ONNX engines: Parakeet, Moonshine, SenseVoice, Paraformer, Dolphin, Omnilingual)
    "voxtype-$pkgver-onnx-avx2::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx2"
    "voxtype-$pkgver-onnx-avx2.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx2.asc"
    "voxtype-$pkgver-onnx-avx512::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx512"
    "voxtype-$pkgver-onnx-avx512.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx512.asc"
    # ONNX CUDA 12 binary + companion shared libs (CUDA 12.x hosts: Ubuntu LTS, Debian, older Fedora)
    "voxtype-$pkgver-onnx-cuda-12::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12"
    "voxtype-$pkgver-onnx-cuda-12.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.asc"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_shared.so"
    # ONNX CUDA 13 binary + companion shared libs (CUDA 13.x hosts: Arch, rolling distros, requires driver 580+)
    # v0.7.3+: cu13 dlopens ORT at runtime (ort/load-dynamic) because Microsoft's
    # prebuilt is the only ORT 1.24.4 build with Blackwell sm_120 coverage and
    # is distributed as .so only. The runtime ships alongside the binary; the
    # install step below symlinks libonnxruntime.so to this versioned name.
    "voxtype-$pkgver-onnx-cuda-13::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13"
    "voxtype-$pkgver-onnx-cuda-13.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.asc"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_shared.so"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime.so.1.24.4::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime.so.1.24.4"
    # ONNX MIGraphX binary + companion shared libs (AMD GPU EP, replaces ROCm in v0.7.0)
    "voxtype-$pkgver-onnx-migraphx::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx"
    "voxtype-$pkgver-onnx-migraphx.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.asc"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_migraphx.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_migraphx.so"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_shared.so"
    # OSD launcher + GTK4 frontend (engine-agnostic, built once in Dockerfile.onnx).
    # The launcher resolves /proc/self/exe, follows the /usr/bin symlink, and
    # probes its parent dir for voxtype-osd-gtk4 / voxtype-osd-native.
    "voxtype-$pkgver-osd::$_github/voxtype-$pkgver-linux-x86_64-osd"
    "voxtype-$pkgver-osd.asc::$_github/voxtype-$pkgver-linux-x86_64-osd.asc"
    "voxtype-$pkgver-osd-gtk4::$_github/voxtype-$pkgver-linux-x86_64-osd-gtk4"
    "voxtype-$pkgver-osd-gtk4.asc::$_github/voxtype-$pkgver-linux-x86_64-osd-gtk4.asc"
    # Quickshell OSD frontend launcher + audio-bridge sidecar (new in v0.7.5).
    # voxtype-osd-quickshell resolves /proc/self/exe and probes its parent dir
    # plus /usr/share/voxtype/quickshell/ for shell.qml, so the QML files
    # shipped further above sit on the lookup path without PATH gymnastics.
    # voxtype-audio-bridge is the NDJSON sidecar that streams audio levels
    # to the Quickshell frontend over a UNIX socket.
    "voxtype-$pkgver-osd-quickshell::$_github/voxtype-$pkgver-linux-x86_64-osd-quickshell"
    "voxtype-$pkgver-osd-quickshell.asc::$_github/voxtype-$pkgver-linux-x86_64-osd-quickshell.asc"
    "voxtype-$pkgver-audio-bridge::$_github/voxtype-$pkgver-linux-x86_64-audio-bridge"
    "voxtype-$pkgver-audio-bridge.asc::$_github/voxtype-$pkgver-linux-x86_64-audio-bridge.asc"
)
sha256sums_x86_64=(
    # Whisper binaries
    'cc051aac0870e21d7378edbcde3ceff10238af12a11650ab897d0ad9195225af'  # voxtype-baseline
    'SKIP'  # voxtype-baseline.asc
    '3462262980e5a75391ffdeb7d3b63f9f638d6261df042f04f9119dfb7aab7770'  # voxtype-avx2
    'SKIP'  # voxtype-avx2.asc
    '6a23ccf9da9e6c6eaff4b23086cea4f97cab53b12526ec88200344d597dea305'  # voxtype-avx512
    'SKIP'  # voxtype-avx512.asc
    '102a7caa22facc5c257c526ae4a9e63c04c027297fec4ca370209a1f94ae9863'  # voxtype-vulkan
    'SKIP'  # voxtype-vulkan.asc
    # ONNX CPU binaries
    '683683ef66de6616e415efa7f7893873d7f8d5bfe4b2b05ce3cf3e467d4733d5'  # voxtype-onnx-avx2
    'SKIP'  # voxtype-onnx-avx2.asc
    '3f60acd56ed7360dc42ba330119b7cb18da4825aabaef883c0fcd5f7ecf5660f'  # voxtype-onnx-avx512
    'SKIP'  # voxtype-onnx-avx512.asc
    # ONNX CUDA 12 binary + companion .so
    '0f0e4b7c738d892435db008c8532c94d20b0c57fd1f3c4cab57b3e5c2a179fc1'  # voxtype-onnx-cuda-12
    'SKIP'  # voxtype-onnx-cuda-12.asc
    'a8584727d51ba646ac63fc991c2f36ad6cd5b8cc8b1141896e46938700b888d0'  # cuda-12.libonnxruntime_providers_cuda.so
    '1b028afc079628d76a28d7eb09700a4baead4a27f9634ba82c35398486134114'  # cuda-12.libonnxruntime_providers_shared.so
    # ONNX CUDA 13 binary + companion .so + dlopen-target libonnxruntime
    '3f11f846e602b9b3d498aedcb71fb9faabaec0fae70d811f32af5694f385929f'  # voxtype-onnx-cuda-13
    'SKIP'  # voxtype-onnx-cuda-13.asc
    'b6cb7744d0efd2faced5c83ead374c13e7f2630b5a249ffaf393cdb1e092c92b'  # cuda-13.libonnxruntime_providers_cuda.so
    'c6a12593396095f5670160e284c35d1700b7708cf3037b7042e2a5200ccae772'  # cuda-13.libonnxruntime_providers_shared.so
    '1aacefdf0b4afa145d410b2381bbc3db3d978c485fb182c42a2b0b09f91f5310'  # cuda-13.libonnxruntime.so.1.24.4
    # ONNX MIGraphX binary + companion .so
    'b57c52034569eba1a25b7b0afc6c8bc4b7a4149fb8a179bf24f9629f34c9b3b4'  # voxtype-onnx-migraphx
    'SKIP'  # voxtype-onnx-migraphx.asc
    'ddd67e6193ade819ee21f1706d1b03b9151f1d2d2843701e2d19d8b183631707'  # migraphx.libonnxruntime_providers_migraphx.so
    '17f7cf47ad0d7b5ac895ae588fd62c7f85a13842588161b6a24c7d480f062be4'  # migraphx.libonnxruntime_providers_shared.so
    # OSD launcher + GTK4 frontend
    'e490fa797f39fd4f518149be851909f1d76059bf57949510ec4c24eb54d3a998'  # voxtype-osd
    'SKIP'  # voxtype-osd.asc
    'e16f96dcf046b9cfa895541bacb73053708f3edefa8d245a2b423b288cd5a0f0'  # voxtype-osd-gtk4
    'SKIP'  # voxtype-osd-gtk4.asc
    # Quickshell OSD launcher + audio-bridge sidecar
    '8947b7ea576096f327e97a488bb6245ba34a71d93ced46fb3b7800e97cca6905'  # voxtype-osd-quickshell
    'SKIP'  # voxtype-osd-quickshell.asc
    '5418b8ac60a1f4293b0221918d1e7b5f275b1f5f4f42addee4af8371244f440d'  # voxtype-audio-bridge
    'SKIP'  # voxtype-audio-bridge.asc
)

# aarch64: one generic CPU Whisper binary and one generic ONNX binary — no
# AVX2/AVX-512 split exists on this architecture, and no GPU-accelerated
# variant ships yet (#547 tracks it; no mainstream consumer arm64 Vulkan
# hardware to build/test against). Experimental until validated on real
# Pi/Ampere/Graviton/Snapdragon X hardware by external users — see the
# "Experimental aarch64 variants" comment in .github/workflows/build-linux.yml.
# voxtype-bin.install's _set_default_backend()/_set_onnx_cuda_symlink()
# already special-case `uname -m = aarch64`; this just ships the binaries
# those functions expect at /usr/lib/voxtype/voxtype-cpu and voxtype-onnx.
source_aarch64=(
    "voxtype-$pkgver-cpu::$_github/voxtype-$pkgver-linux-aarch64-cpu"
    "voxtype-$pkgver-cpu.asc::$_github/voxtype-$pkgver-linux-aarch64-cpu.asc"
    "voxtype-$pkgver-onnx::$_github/voxtype-$pkgver-linux-aarch64-onnx"
    "voxtype-$pkgver-onnx.asc::$_github/voxtype-$pkgver-linux-aarch64-onnx.asc"
    "voxtype-$pkgver-osd::$_github/voxtype-$pkgver-linux-aarch64-osd"
    "voxtype-$pkgver-osd.asc::$_github/voxtype-$pkgver-linux-aarch64-osd.asc"
    "voxtype-$pkgver-osd-gtk4::$_github/voxtype-$pkgver-linux-aarch64-osd-gtk4"
    "voxtype-$pkgver-osd-gtk4.asc::$_github/voxtype-$pkgver-linux-aarch64-osd-gtk4.asc"
    "voxtype-$pkgver-osd-quickshell::$_github/voxtype-$pkgver-linux-aarch64-osd-quickshell"
    "voxtype-$pkgver-osd-quickshell.asc::$_github/voxtype-$pkgver-linux-aarch64-osd-quickshell.asc"
    "voxtype-$pkgver-audio-bridge::$_github/voxtype-$pkgver-linux-aarch64-audio-bridge"
    "voxtype-$pkgver-audio-bridge.asc::$_github/voxtype-$pkgver-linux-aarch64-audio-bridge.asc"
)
sha256sums_aarch64=(
    'f29bdbf6c3c2535ebe8be3abb6ded7d6c0ac9b16392ea3b5ba231e06a7b05687'  # voxtype-cpu
    'SKIP'  # voxtype-cpu.asc
    'e038613888a1d05164b01d4a992666ab08967f415f72e3adb0cea033166d1418'  # voxtype-onnx
    'SKIP'  # voxtype-onnx.asc
    '0ea8b8c2c4c1b2947181efafd1d159684b06d97d90c6b5350e0fda384e645914'  # voxtype-osd
    'SKIP'  # voxtype-osd.asc
    '4cdff10f6e41d538998c59c374ce971c651f14aab4ea4a437a0c612b825d80f9'  # voxtype-osd-gtk4
    'SKIP'  # voxtype-osd-gtk4.asc
    'ead0dff4c0a43864b2ea79ebb56b27d059eef4c6d44301f351bc9c5cae1a8397'  # voxtype-osd-quickshell
    'SKIP'  # voxtype-osd-quickshell.asc
    'e819adbd0b0ff933c75a3b81f036a45a2f4bc200d121c142a3bc9f2e080a18a2'  # voxtype-audio-bridge
    'SKIP'  # voxtype-audio-bridge.asc
)

package() {
    if [ "$CARCH" = "aarch64" ]; then
        # One generic CPU Whisper binary, one generic ONNX binary — matches
        # what voxtype-bin.install's _set_default_backend() installs
        # unconditionally on this arch (no AVX2/AVX-512 split, no GPU EP).
        install -Dm755 "$srcdir/voxtype-$pkgver-cpu" "$pkgdir/usr/lib/voxtype/voxtype-cpu"
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx" "$pkgdir/usr/lib/voxtype/voxtype-onnx"
    else
        # Install Whisper CPU binaries to /usr/lib/voxtype/
        install -Dm755 "$srcdir/voxtype-$pkgver-baseline" "$pkgdir/usr/lib/voxtype/voxtype-baseline"
        install -Dm755 "$srcdir/voxtype-$pkgver-avx2" "$pkgdir/usr/lib/voxtype/voxtype-avx2"
        install -Dm755 "$srcdir/voxtype-$pkgver-avx512" "$pkgdir/usr/lib/voxtype/voxtype-avx512"

        # Install Whisper Vulkan GPU binary
        install -Dm755 "$srcdir/voxtype-$pkgver-vulkan" "$pkgdir/usr/lib/voxtype/voxtype-vulkan"

        # Install ONNX CPU binaries (no GPU EP, no companion .so files)
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx2" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx2"
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx512" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx512"

        # GPU-using ONNX binaries each live in their own subdirectory alongside
        # the EP companion shared libs they dlopen at runtime. ort 2.0.0-rc.12's
        # CUDA/MIGraphX EPs resolve their .so files via /proc/self/exe; if they
        # aren't co-located, EP registration fails and ort silently falls back
        # to CPU. /proc/self/exe follows symlinks, so the user-facing names at
        # /usr/lib/voxtype/voxtype-onnx-* are symlinks into these subdirs.

        # ONNX CUDA 12 (locked to libcudart.so.12 ABI)
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda-12" \
            "$pkgdir/usr/lib/voxtype/cuda-12/voxtype-onnx-cuda-12"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_cuda.so" \
            "$pkgdir/usr/lib/voxtype/cuda-12/libonnxruntime_providers_cuda.so"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_shared.so" \
            "$pkgdir/usr/lib/voxtype/cuda-12/libonnxruntime_providers_shared.so"
        ln -sf "cuda-12/voxtype-onnx-cuda-12" \
            "$pkgdir/usr/lib/voxtype/voxtype-onnx-cuda-12"

        # ONNX CUDA 13 (locked to libcudart.so.13 ABI, requires driver 580+).
        # v0.7.3+: dlopens ORT at runtime. Install Microsoft's libonnxruntime
        # under its SONAME plus a libonnxruntime.so symlink that ort/load-dynamic
        # expects (resolved relative to /proc/self/exe, see ort src/lib.rs:96-109).
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda-13" \
            "$pkgdir/usr/lib/voxtype/cuda-13/voxtype-onnx-cuda-13"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so" \
            "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_cuda.so"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so" \
            "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_shared.so"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime.so.1.24.4" \
            "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime.so.1.24.4"
        ln -sf "libonnxruntime.so.1.24.4" \
            "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime.so"
        ln -sf "cuda-13/voxtype-onnx-cuda-13" \
            "$pkgdir/usr/lib/voxtype/voxtype-onnx-cuda-13"

        # ONNX MIGraphX (AMD GPU EP, replaces ROCm in v0.7.0)
        install -Dm755 "$srcdir/voxtype-$pkgver-onnx-migraphx" \
            "$pkgdir/usr/lib/voxtype/migraphx/voxtype-onnx-migraphx"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_migraphx.so" \
            "$pkgdir/usr/lib/voxtype/migraphx/libonnxruntime_providers_migraphx.so"
        install -Dm644 "$srcdir/voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_shared.so" \
            "$pkgdir/usr/lib/voxtype/migraphx/libonnxruntime_providers_shared.so"
        ln -sf "migraphx/voxtype-onnx-migraphx" \
            "$pkgdir/usr/lib/voxtype/voxtype-onnx-migraphx"

        # Compatibility symlink for users with scripts referencing the old
        # voxtype-onnx-rocm name. The AMD GPU EP changed from ROCm to MIGraphX
        # in v0.7.0; ship one release with both names to soften the transition.
        # Drop in v0.8.0.
        ln -sf "voxtype-onnx-migraphx" "$pkgdir/usr/lib/voxtype/voxtype-onnx-rocm"
    fi

    # /usr/bin/voxtype symlink and the unversioned voxtype-onnx-cuda symlink
    # are created by the .install script's post_install/post_upgrade hooks
    # so they can pick the right CUDA variant for the host (a no-op on
    # aarch64, where _set_onnx_cuda_symlink() short-circuits).

    # OSD launcher + GTK4 frontend. The launcher resolves /proc/self/exe and
    # probes its parent directory, so it finds /usr/lib/voxtype/voxtype-osd-gtk4
    # and voxtype-osd-quickshell without needing them on PATH. Only the
    # launcher gets a /usr/bin symlink.
    install -Dm755 "$srcdir/voxtype-$pkgver-osd" "$pkgdir/usr/lib/voxtype/voxtype-osd"
    install -Dm755 "$srcdir/voxtype-$pkgver-osd-gtk4" "$pkgdir/usr/lib/voxtype/voxtype-osd-gtk4"
    install -Dm755 "$srcdir/voxtype-$pkgver-osd-quickshell" "$pkgdir/usr/lib/voxtype/voxtype-osd-quickshell"
    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-osd "$pkgdir/usr/bin/voxtype-osd"

    # voxtype-audio-bridge: NDJSON sidecar that streams audio levels over a
    # UNIX socket to the Quickshell OSD. Lives in /usr/bin because the
    # quickshell launcher exec's it directly by basename.
    install -Dm755 "$srcdir/voxtype-$pkgver-audio-bridge" "$pkgdir/usr/bin/voxtype-audio-bridge"

    # Quickshell QML tree. The frontend looks for shell.qml under
    # /usr/share/voxtype/quickshell/ after user/runtime paths. The
    # voxtype-shared/ subdirectory holds a QML module (Theme, StateReader,
    # AudioBridge) registered via qmldir — keep the layout intact or
    # `import voxtype-shared 1.0` fails to resolve.
    # Copy the whole tree so a QML file added upstream can never be missed
    # here (the #697/#762 failure class). Mirrors scripts/package.sh exactly.
    install -d "$pkgdir/usr/share/voxtype"
    cp -a "$srcdir/voxtype-$pkgver/quickshell" "$pkgdir/usr/share/voxtype/"
    find "$pkgdir/usr/share/voxtype/quickshell" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/voxtype/quickshell" -type d -exec chmod 755 {} +

    # OSD style packages and recipes. The style resolver searches
    # /usr/share/voxtype/osd/<name> after the user paths, so shipping the
    # example packages gives [osd] style = "<name>" something to resolve out
    # of the box; a user copy in ~/.config or ~/.local/share still shadows
    # them. Whole trees from the same source tarball, no extra sources.
    install -d "$pkgdir/usr/share/voxtype/osd" "$pkgdir/usr/share/voxtype/osd-recipes"
    cp -a "$srcdir/voxtype-$pkgver/examples/osd-packages/." "$pkgdir/usr/share/voxtype/osd/"
    find "$pkgdir/usr/share/voxtype/osd" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/voxtype/osd" -type d -exec chmod 755 {} +
    cp -a "$srcdir/voxtype-$pkgver/examples/osd-recipes/." "$pkgdir/usr/share/voxtype/osd-recipes/"
    find "$pkgdir/usr/share/voxtype/osd-recipes" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/voxtype/osd-recipes" -type d -exec chmod 755 {} +

    # Desktop entry for the TUI configure command, surfaced in walker/rofi/fuzzel/etc.
    # The launcher discovers a terminal emulator and runs `voxtype configure` inside it.
    install -Dm755 "$srcdir/voxtype-configure-launcher-$pkgver" \
        "$pkgdir/usr/bin/voxtype-configure-launcher"
    install -Dm644 "$srcdir/voxtype-configure-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/voxtype-configure.desktop"

    # Install default configuration
    install -Dm644 "$srcdir/config-$pkgver.toml" "$pkgdir/etc/voxtype/config.toml"

    # Install systemd user service
    install -Dm644 "$srcdir/voxtype-$pkgver.service" "$pkgdir/usr/lib/systemd/user/voxtype.service"

    # Install documentation
    install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 "$srcdir/voxtype-$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"
}
