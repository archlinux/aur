# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux (pre-built binaries)"
arch=('x86_64')
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
source=(
    # Whisper binaries
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
    # shipped further below sit on the lookup path without PATH gymnastics.
    # voxtype-audio-bridge is the NDJSON sidecar that streams audio levels
    # to the Quickshell frontend over a UNIX socket.
    "voxtype-$pkgver-osd-quickshell::$_github/voxtype-$pkgver-linux-x86_64-osd-quickshell"
    "voxtype-$pkgver-osd-quickshell.asc::$_github/voxtype-$pkgver-linux-x86_64-osd-quickshell.asc"
    "voxtype-$pkgver-audio-bridge::$_github/voxtype-$pkgver-linux-x86_64-audio-bridge"
    "voxtype-$pkgver-audio-bridge.asc::$_github/voxtype-$pkgver-linux-x86_64-audio-bridge.asc"
    # Config and support files
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
    # Quickshell QML tree (new in v0.7.5). voxtype-osd-quickshell probes
    # /usr/share/voxtype/quickshell/ for shell.qml after the user/runtime
    # paths, so shipping these files lets users opt in via
    # [osd] frontend = "quickshell" with no manual file copies. The
    # voxtype-shared/ subdirectory contains a QML module (Theme, StateReader,
    # AudioBridge) registered via qmldir — keep the layout intact.
    "quickshell-shell-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/shell.qml"
    "quickshell-OsdSurface-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/OsdSurface.qml"
    "quickshell-EnginePicker-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/EnginePicker.qml"
    "quickshell-MeetingControls-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/MeetingControls.qml"
    "quickshell-voxtype-shared-Theme-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/Theme.qml"
    "quickshell-voxtype-shared-StateReader-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/StateReader.qml"
    "quickshell-voxtype-shared-AudioBridge-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/AudioBridge.qml"
    "quickshell-voxtype-shared-StyleLoader-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/StyleLoader.qml"
    "quickshell-voxtype-shared-RecipeRenderer-$pkgver.qml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/RecipeRenderer.qml"
    "quickshell-voxtype-shared-qmldir-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/quickshell/voxtype-shared/qmldir"
)
sha256sums=(
    # Whisper binaries
    'cb3843a894ef47aca230b30bb1c45c2ef8e0d015adf2fa754d60e55123165fd0'  # voxtype-avx2
    'SKIP'                                                             # voxtype-avx2.asc
    '77d49275ae4c3a6d93671014278b0dabd69ba52e65d2ee6ab3ec1bff0af34d55'  # voxtype-avx512
    'SKIP'                                                             # voxtype-avx512.asc
    'c569d038057464aa60290296794bcbd79b928ee0efd038e33062a4c015558ed8'  # voxtype-vulkan
    'SKIP'                                                             # voxtype-vulkan.asc
    # ONNX CPU binaries
    '19b8716ff7bd388ffb18843fc0ee5e614faa84544d22918ecf72a7c3d6c02929'  # voxtype-onnx-avx2
    'SKIP'                                                             # voxtype-onnx-avx2.asc
    '69a6e6fc1c04a55eeb62cf1eaa5fe81873c70eabffff120ce1a4ff7ef62fd559'  # voxtype-onnx-avx512
    'SKIP'                                                             # voxtype-onnx-avx512.asc
    # ONNX CUDA 12 binary + companion .so
    'e7180f17add10bb441368d8495fc99bde0ba1a1978ea5f7a52d7e626779eca16'  # voxtype-onnx-cuda-12
    'SKIP'                                                             # voxtype-onnx-cuda-12.asc
    'a8584727d51ba646ac63fc991c2f36ad6cd5b8cc8b1141896e46938700b888d0'  # cuda-12.libonnxruntime_providers_cuda.so
    '1b028afc079628d76a28d7eb09700a4baead4a27f9634ba82c35398486134114'  # cuda-12.libonnxruntime_providers_shared.so
    # ONNX CUDA 13 binary + companion .so + dlopen-target libonnxruntime
    '4de2aac42b67a05c34ac0b23f771fc83968670fd77d14781cbf4483524304cd1'  # voxtype-onnx-cuda-13
    'SKIP'                                                             # voxtype-onnx-cuda-13.asc
    'b6cb7744d0efd2faced5c83ead374c13e7f2630b5a249ffaf393cdb1e092c92b'  # cuda-13.libonnxruntime_providers_cuda.so
    'c6a12593396095f5670160e284c35d1700b7708cf3037b7042e2a5200ccae772'  # cuda-13.libonnxruntime_providers_shared.so
    '1aacefdf0b4afa145d410b2381bbc3db3d978c485fb182c42a2b0b09f91f5310'  # cuda-13.libonnxruntime.so.1.24.4
    # ONNX MIGraphX binary + companion .so
    'f7a4cc0deaf35110b5106f1fc1f83dded41c0b1780f9fb5aa9cccc3c62e5eb6a'  # voxtype-onnx-migraphx
    'SKIP'                                                             # voxtype-onnx-migraphx.asc
    'ddd67e6193ade819ee21f1706d1b03b9151f1d2d2843701e2d19d8b183631707'  # migraphx.libonnxruntime_providers_migraphx.so
    '17f7cf47ad0d7b5ac895ae588fd62c7f85a13842588161b6a24c7d480f062be4'  # migraphx.libonnxruntime_providers_shared.so
    # OSD launcher + GTK4 frontend
    '7250027b1672507a6d584f795731c87e1d3b5c1de891438bd55e34b136a2d5cc'  # voxtype-osd
    'SKIP'                                                             # voxtype-osd.asc
    '74fb0f6ad87feb0c1c9e06a8b28a7f7ecee101caef4248f77dcf613b5271238e'  # voxtype-osd-gtk4
    'SKIP'                                                             # voxtype-osd-gtk4.asc
    # Quickshell OSD launcher + audio-bridge sidecar (new in v0.7.5)
    'b809c5140e844a6add801d7e592775cd89af8cce73fa399b6a3aec15dfd09533'  # voxtype-osd-quickshell
    'SKIP'                                                             # voxtype-osd-quickshell.asc
    '45776290e364194d83a8b89445166406c278e890507bf07ec52a5f0e8fa57720'  # voxtype-audio-bridge
    'SKIP'                                                             # voxtype-audio-bridge.asc
    # Config and support files
    'f4b2bccd56b31a6a50e1c0a8b6b72383dc1e636f9ccb8cb070442d58b7314579'  # config/default.toml
    '531c3658e229619e56bb01659fb81f401767b85e1d6e2acd1ac67ee3414a168c'  # voxtype.service
    '65c95805d9b03ccc2fadb9d63a03ab79974b00091df8457ee8ef290ec6bd5b12'  # voxtype.bash
    'e5e63b3c7f48238cf719e4f2ef90c1f9c5c7e8cd25eaebc9f78bdd34b24b6605'  # voxtype.zsh
    'f720ddd24ee97c105b448323899c36bca7c63d00c2d42c4a3da70c3d157dccbb'  # voxtype.fish
    '31123c45b4ff9cb5fd9e01083350fea6ccaf14969013fd48e4c95fdf89e6eb4b'  # LICENSE
    'e5b2ec5da5eafe2ce8f7b84b81a889f2ff496ad6488d56b6b9b32b73d025ed53'  # README.md
    # Desktop entry + launcher
    '32144a4a5210092b0aa909f6de7a43ebe8bbf82fa3dfb1f3519787512fdf8e4b'  # voxtype-configure.desktop
    '044b1f7b52cc610ce57ba624111d882029b0ce4bc3e2c2c360f96d07f69e0e85'  # voxtype-configure-launcher
    # Quickshell QML tree (new in v0.7.5)
    'd3d0b0b24a3fc3e252623a6fad898c7d1d147fb8c2e49de90fbf452e95de63ab'  # quickshell/shell.qml
    '70a611fd4eabde43189aee0619899827de21e36695191648dc36470d4c333de6'  # quickshell/OsdSurface.qml
    '4d6eef505ec161080ca92ae6a355ca00dcc7bb05d5b190534a1851fcbb726e55'  # quickshell/EnginePicker.qml
    '54271a8f0e4b52f40505f32801f4c78399ac356ed1e80906ca8a068ecb7ee734'  # quickshell/MeetingControls.qml
    'aaa011682b92d8e25863a9ea34a469b897bac15ad939292d8144b012fa05b209'  # quickshell/voxtype-shared/Theme.qml
    '74345f9d8b77de3f1d6d08a759e52506c606e8af3d04a97a5bfe7954d0f64604'  # quickshell/voxtype-shared/StateReader.qml
    '2ad530f92f13fc7f1100e6f6c9910878c35d911e91dc60feb902c2542b619230'  # quickshell/voxtype-shared/AudioBridge.qml
    '45180488129f16a0568c217c743ce7e45831acb0cb287346d6da5b2fc097717b'  # quickshell/voxtype-shared/StyleLoader.qml
    'd5e9a86946dc8dc2afabdcd00d79d973181e51b2e5e8aea2772960aaf1ff2283'  # quickshell/voxtype-shared/RecipeRenderer.qml
    '41b894baa1487e47db5f9ec4baeea9c02b6a76d3c8198b4700a88e2cb7ec0b62'  # quickshell/voxtype-shared/qmldir
)

package() {
    # Install Whisper CPU binaries to /usr/lib/voxtype/
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

    # /usr/bin/voxtype symlink and the unversioned voxtype-onnx-cuda symlink
    # are created by the .install script's post_install/post_upgrade hooks
    # so they can pick the right CUDA variant for the host.

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
    install -Dm644 "$srcdir/quickshell-shell-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/shell.qml"
    install -Dm644 "$srcdir/quickshell-OsdSurface-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/OsdSurface.qml"
    install -Dm644 "$srcdir/quickshell-EnginePicker-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/EnginePicker.qml"
    install -Dm644 "$srcdir/quickshell-MeetingControls-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/MeetingControls.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-Theme-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/Theme.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-StateReader-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/StateReader.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-AudioBridge-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/AudioBridge.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-StyleLoader-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/StyleLoader.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-RecipeRenderer-$pkgver.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/RecipeRenderer.qml"
    install -Dm644 "$srcdir/quickshell-voxtype-shared-qmldir-$pkgver" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/qmldir"

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
