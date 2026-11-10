# Maintainer: Peter Jackson <pete@peteonrails.com>
#
# Choosing variants
# -----------------
# The release ships one binary per CPU tier and GPU runtime, about 914 MB on
# x86_64. This PKGBUILD downloads only what the build machine uses:
#   - the CPU build for this CPU (avx512, avx2 or baseline);
#   - baseline and the generic GGUF worker, so a default can always run,
#     even when the package is installed on a different CPU;
#   - vulkan, the GPU path for Whisper and every GGUF model;
#   - the variant /usr/bin/voxtype runs now, so an upgrade keeps it;
#   - every variant asked for in an earlier build, as recorded in
#     /usr/lib/voxtype/package-variants.
# Add variants with VOXTYPE_VARIANTS, a comma or space separated list:
#   VOXTYPE_VARIANTS=onnx-cuda-13 makepkg -si
#   VOXTYPE_VARIANTS=onnx-migraphx yay -S --rebuild voxtype-bin
#   VOXTYPE_VARIANTS=onnx-migraphx paru -S --rebuild voxtype-bin
# Names (x86_64): baseline avx2 avx512 vulkan onnx-avx2 onnx-avx512
# onnx-cuda-12 onnx-cuda-13 onnx-migraphx. aarch64: cpu onnx.
# "all" downloads every variant, as voxtype-bin did before 1.2.1. "default"
# forgets the variants asked for in earlier builds.
#
# Repackagers and build farms must set VOXTYPE_VARIANTS=all: the selection
# reads the machine that builds the package. A clean chroot (makechrootpkg,
# pkgctl build, paru --chroot) passes no environment and cannot see
# /usr/bin/voxtype, so it builds the default set; voxtype-bin.install then
# warns if that drops the backend in use.
#
# Maintainers: generate .SRCINFO with
#   VOXTYPE_VARIANTS=all makepkg --printsrcinfo > .SRCINFO
# and fill checksums with scripts/aur-fill-sums.sh from the voxtype repo,
# which reads the release's CI-signed SHA256SUMS.txt. updpkgsums only sees
# the selected variants and cannot fill the _vt_assets_<arch> tables.
pkgname=voxtype-bin
pkgver=1.2.1
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
# The GGUF worker beside the vulkan and every x86_64 ONNX binary is built with
# Vulkan and links libvulkan.so.1, so it cannot start without the loader, even
# when gguf_backend = "auto" ends up on the CPU. New in 1.2.0. aarch64 ships
# CPU-only workers and does not need it.
depends_x86_64=(
    'vulkan-icd-loader'
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
    'cuda: GPU acceleration via CUDA 13 for ONNX engines (NVIDIA GPUs, requires driver 580+)'
    'cuda12.6: GPU acceleration via CUDA 12 for ONNX engines (older NVIDIA setups)'
    'rocm-hip-runtime: ROCm runtime (required by migraphx)'
    'migraphx: AMD GPU graph optimization for the MIGraphX execution provider, required for AMD GPU acceleration on ONNX engines'
    'ollama: local AI summarization for meeting mode'
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
    'quickshell: Quickshell-based OSD frontend (opt in via [osd] frontend = "quickshell")'
)
# aarch64 has no GPU-accelerated binary variant yet (#547 tracks it): no
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
    # keyring from v0.6.x installs, so keep it listed so old assets verify.
    'E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6'
    # Voxtype CI release signing primary (cross-signed by E79F5BAF...).
    # Lives in CI secrets; signs .deb / .rpm / source-archive .asc starting
    # in v0.7.5. Auto-fetchable by fingerprint from public keyservers, so
    # makepkg verifies cleanly on first install without manual gpg --recv-keys.
    '9CCF7915B750CAE8B095ED1AA3FC9F33FD209279'
)
# pkgver uses the dot form for a release candidate (1.2.1.rc1) because pacman
# forbids hyphens there; _vt_ver is the upstream tag form (1.2.1-rc1) used in
# URLs, asset names and the source archive's top directory.
_vt_ver="${pkgver/.rc/-rc}"
_github="https://github.com/peteonrails/voxtype/releases/download/v$_vt_ver"

# Architecture-independent files: config, service unit, shell completions,
# license, docs, desktop entry + launcher, and the signed source archive
# (Quickshell QML tree, Omarchy Settings plugin, OSD style/recipe examples,
# identical on every arch).
source=(
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/README.md"
    # Desktop entry + terminal launcher for `voxtype configure` (TUI surfaced in walker/rofi/etc.)
    "voxtype-configure-$pkgver.desktop::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/voxtype-configure.desktop"
    "voxtype-configure-launcher-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$_vt_ver/packaging/scripts/voxtype-configure-launcher"
    # Quickshell QML tree and the Omarchy Settings plugin, copied from the
    # signed source archive. Hand-listing individual QML files here is how
    # #488, #697, and #762 happened: scripts/package.sh tars the whole
    # quickshell/ directory, so deb and rpm never drifted, while this
    # PKGBUILD's enumeration silently fell behind three times. The
    # auto-generated GitHub archive is signed byte-for-byte by CI (see the
    # #415 post-mortem), so we verify it like every binary.
    "voxtype-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$_vt_ver.tar.gz"
    "voxtype-$pkgver.tar.gz.asc::$_github/voxtype-$_vt_ver.tar.gz.asc"
)
sha256sums=(
    '7c76f22f1dea86d304c6bfa38601e45c278cbff051cb412357f889b442d83cfa'  # config/default.toml
    '531c3658e229619e56bb01659fb81f401767b85e1d6e2acd1ac67ee3414a168c'  # voxtype.service
    '65c95805d9b03ccc2fadb9d63a03ab79974b00091df8457ee8ef290ec6bd5b12'  # voxtype.bash
    'e5e63b3c7f48238cf719e4f2ef90c1f9c5c7e8cd25eaebc9f78bdd34b24b6605'  # voxtype.zsh
    'f720ddd24ee97c105b448323899c36bca7c63d00c2d42c4a3da70c3d157dccbb'  # voxtype.fish
    '31123c45b4ff9cb5fd9e01083350fea6ccaf14969013fd48e4c95fdf89e6eb4b'  # LICENSE
    'ebf04c934b697c0a9af68e750f2076892b14c4cd4aead5aab94df73692bc0b8a'  # README.md
    '32144a4a5210092b0aa909f6de7a43ebe8bbf82fa3dfb1f3519787512fdf8e4b'  # voxtype-configure.desktop
    'f8a626280b26b7f34b2221c7a16dc9d98f18085b7373cc60afc5c514e5ce18e4'  # voxtype-configure-launcher
    'e20fa6f176f3367d4fae872bd6933ac446c49390c658f499588215ca466851b9'  # voxtype-$pkgver.tar.gz (source archive)
    'SKIP'  # voxtype-$pkgver.tar.gz.asc
)

# Every release asset per arch, as variant|asset|sha256. The download is
# voxtype-$_vt_ver-linux-<arch>-<asset> plus its detached .asc signature,
# saved as voxtype-$pkgver-<asset>. Variant "common" is always installed.
# Checksums come from the release's CI-signed SHA256SUMS.txt via
# scripts/aur-fill-sums.sh; the three GPU ONNX workers are the same build,
# so their sums match.
_vt_assets_x86_64=(
    # Whisper binaries, each followed by its GGUF worker (new in 1.2.0).
    # baseline: x86-64-v2, for pre-AVX2 CPUs (#612). Its worker is the
    # generic voxtype-gguf-worker every binary falls back to.
    'baseline|baseline|4a75621270504168be9b0b44113bc1b19e5f0dbca540a3de78b4806034f751e1'
    'baseline|baseline.gguf-worker|cbb1a2921a6e5cbf39a061854b56b3a10dbc204b4195b4648d7b53eaeb8fde2e'
    'avx2|avx2|8f4e911a62183a4b81fbb9b265018b36a5afc631162235c1436f98252db545b4'
    'avx2|avx2.gguf-worker|f277e2320798a8dc2f099a89886450024b9753b7f8962eeb1b5bcb867fc504aa'
    'avx512|avx512|2f4e382014a1d438be264eec22325fe0b4ca1983c0c5a99a9c9f519f22e5dc35'
    'avx512|avx512.gguf-worker|7157230215332737da83667f5a4b4436cd94aad7cb0dd4cd02f88293da819876'
    'vulkan|vulkan|3e246b8cc455c897ffbb2fa8156f2e4689ded55c4ae0a2386de06fbab510ae9e'
    'vulkan|vulkan.gguf-worker|118dafbd855743dbdc486f8d7e98b26ec8f6389790fc28bc255a510b8218ce77'
    # ONNX CPU binaries (Parakeet, Moonshine, SenseVoice, Paraformer, Dolphin,
    # Omnilingual, Cohere) plus their Vulkan-capable GGUF workers
    'onnx-avx2|onnx-avx2|b11ad3fd1214565ff773b5a30f845f32e5dce36f19ec6d666d2bdd9cc774953c'
    'onnx-avx2|onnx-avx2.gguf-worker|5d21d334a41f2582ede118b922af7cf42c241521a9f5403d61d18661d46dd7e5'
    'onnx-avx512|onnx-avx512|67e8af71d9a22b6c767656a2fb34b4aeeb5909c10325a4aca7fbcab623cb7726'
    'onnx-avx512|onnx-avx512.gguf-worker|acaba0a62c4095c73b143764838f7596fcd98fa53f687353cbc79993156995cc'
    # ONNX CUDA 12 (CUDA 12.x hosts: Ubuntu LTS, Debian, older Fedora)
    'onnx-cuda-12|onnx-cuda-12|87b7c1fc5c3f6d14bd2a26be158b23b0348d28aad1e46d7b5fad94ee83b97f06'
    'onnx-cuda-12|onnx-cuda-12.gguf-worker|266236d6bd0cfa023d92d0cdd0f895d5d1bbeafe44b6bb3d2f3c2f4d2fe71a41'
    'onnx-cuda-12|onnx-cuda-12.libonnxruntime_providers_cuda.so|a8584727d51ba646ac63fc991c2f36ad6cd5b8cc8b1141896e46938700b888d0'
    'onnx-cuda-12|onnx-cuda-12.libonnxruntime_providers_shared.so|1b028afc079628d76a28d7eb09700a4baead4a27f9634ba82c35398486134114'
    # ONNX CUDA 13 (CUDA 13.x hosts: Arch, rolling distros, driver 580+).
    # v0.7.3+: cu13 dlopens ORT at runtime (ort/load-dynamic) because
    # Microsoft's prebuilt is the only ORT 1.24.4 build with Blackwell sm_120
    # coverage and is distributed as .so only.
    'onnx-cuda-13|onnx-cuda-13|8a7ac5b573452b0cafc621551783b03279a39381ae1ce53f48af0b0ff9b17fee'
    'onnx-cuda-13|onnx-cuda-13.gguf-worker|266236d6bd0cfa023d92d0cdd0f895d5d1bbeafe44b6bb3d2f3c2f4d2fe71a41'
    'onnx-cuda-13|onnx-cuda-13.libonnxruntime_providers_cuda.so|b6cb7744d0efd2faced5c83ead374c13e7f2630b5a249ffaf393cdb1e092c92b'
    'onnx-cuda-13|onnx-cuda-13.libonnxruntime_providers_shared.so|c6a12593396095f5670160e284c35d1700b7708cf3037b7042e2a5200ccae772'
    'onnx-cuda-13|onnx-cuda-13.libonnxruntime.so.1.24.4|1aacefdf0b4afa145d410b2381bbc3db3d978c485fb182c42a2b0b09f91f5310'
    # ONNX MIGraphX (AMD GPU EP, replaces ROCm in v0.7.0)
    'onnx-migraphx|onnx-migraphx|18de08441759babe197eca1d9b29c2003adc6eeeafc2ec8be00534c600ffdf05'
    'onnx-migraphx|onnx-migraphx.gguf-worker|266236d6bd0cfa023d92d0cdd0f895d5d1bbeafe44b6bb3d2f3c2f4d2fe71a41'
    'onnx-migraphx|onnx-migraphx.libonnxruntime_providers_migraphx.so|ddd67e6193ade819ee21f1706d1b03b9151f1d2d2843701e2d19d8b183631707'
    'onnx-migraphx|onnx-migraphx.libonnxruntime_providers_shared.so|17f7cf47ad0d7b5ac895ae588fd62c7f85a13842588161b6a24c7d480f062be4'
    # OSD launcher, GTK4 and Quickshell frontends, audio-bridge sidecar
    'common|osd|afc121f235e6920fe6aa53c9b0ae65bb11e46d7889391a197b33e32ed1706997'
    'common|osd-gtk4|a62c6bbe10879b8292dba66ad42cb9ec86fef7a4aa56f00ee8f1b8a1c90b03bb'
    'common|osd-quickshell|97596d084f5d0d90edbee47bbaa1c45186e9b15af0bcdf186426624931f0407d'
    'common|audio-bridge|e06637b02af8c655e77a18f576f2db795cf71e0e0edefdad1ad1760947bde28e'
)
_vt_assets_aarch64=(
    # aarch64: one generic CPU Whisper binary and one generic ONNX binary. No
    # AVX2/AVX-512 split exists on this architecture, and no GPU variant ships
    # yet (#547). Experimental until validated on real Pi/Ampere/Graviton/
    # Snapdragon X hardware (see .github/workflows/build-linux.yml).
    'cpu|cpu|7b9c63877ae5cfb5db2d01eb5b5348a2dd92ef0d8e81ba67d176e69c787c2201'
    'cpu|cpu.gguf-worker|15d0e6008e72087cccb275eaa8b5fa54d3cba4d98783a08b7c2c7be7f5b508cf'
    'onnx|onnx|ecb0a1fc39d176115a72bb9ea4ab9e5979cd42e42a2ba5ef630e96b3e35c1e70'
    'onnx|onnx.gguf-worker|fbdf115a691b92a3dd9bf318a8ceb5aad60872d091e977af913822909a70c6ee'
    'common|osd|fce0eb8f2e00863ff769c92dc6443dbe4e643bb2d7f51018394ca69f5fa98e28'
    'common|osd-gtk4|1003bef58bfaf3fbaa4efa9044c9a6dc93e04c3ba584e867c8310aab2544067d'
    'common|osd-quickshell|ba0063643d74c1f1ce6b42d5f9607bc90de7fd7509d6a7e5cb6983030c1a2ac3'
    'common|audio-bridge|270a5496e8284ce06d44baab9426f4c11df84ae5272d5eb78296b6e93d8f14f3'
)

# Every variant per arch, in the order package-variants lists them.
_vt_variants_x86_64=(baseline avx2 avx512 vulkan onnx-avx2 onnx-avx512 onnx-cuda-12 onnx-cuda-13 onnx-migraphx)
_vt_variants_aarch64=(cpu onnx)

# Every path the selector reads goes through _vt_root, empty on a real build,
# so scripts/test-aur-bin.sh can point it at a fixture tree.
: "${_vt_root:=}"

_vt_die() {
    printf '==> ERROR: %s\n' "$*" >&2
    exit 1
}

# Echo the variants valid for arch $1.
_vt_known() {
    local -n _known="_vt_variants_$1"
    printf '%s\n' "${_known[*]}"
}

# The host's CUDA runtime major (12 or 13), matching voxtype-bin.install's
# _detect_cuda_major. Defaults to 13 like the install script's upgrade path.
_vt_cuda_major() {
    local major
    if [[ -z $_vt_root ]] && command -v ldconfig >/dev/null 2>&1; then
        for major in 13 12; do
            if ldconfig -p 2>/dev/null | grep -q "libcudart\.so\.$major\b"; then
                echo "$major"
                return 0
            fi
        done
    fi
    for major in 13 12; do
        if [[ -e $_vt_root/usr/lib/libcudart.so.$major || -e $_vt_root/opt/cuda/lib64/libcudart.so.$major ]]; then
            echo "$major"
            return 0
        fi
    done
    echo 13
}

# Follow a symlink chain inside $_vt_root and echo the final path (without
# the root prefix). Stops after 8 hops or at a dangling link.
_vt_follow() {
    local path=$1 hops=0 next
    while [[ -L $_vt_root$path ]] && (( hops < 8 )); do
        next=$(readlink -- "$_vt_root$path") || break
        if [[ $next == /* ]]; then
            path=$next
        else
            path="${path%/*}/$next"
        fi
        hops=$((hops + 1))
    done
    printf '%s\n' "$path"
}

# Echo the binary /usr/bin/voxtype dispatches to: a symlink's target, or the
# exec line of the wrapper voxtype-bin.install writes for GPU ONNX variants.
_vt_active_binary() {
    local bin=/usr/bin/voxtype target=""
    if [[ -L $_vt_root$bin ]]; then
        target=$(_vt_follow "$bin")
    elif [[ -f $_vt_root$bin ]]; then
        target=$(sed -n 's/^exec \([^ ]*\).*/\1/p' "$_vt_root$bin" 2>/dev/null | head -n 1)
        if [[ -n $target ]]; then
            target=$(_vt_follow "$target")
        fi
    fi
    printf '%s\n' "$target"
}

# Map a requested name or an installed binary name to a variant, or echo
# nothing. Accepts an optional "voxtype-" prefix and the names older releases
# installed: voxtype-parakeet-* (0.6.x), voxtype-onnx-rocm and the
# unversioned voxtype-onnx-cuda (before 0.7.0).
_vt_normalize() {
    local name=${1#voxtype-}
    case "$name" in
        parakeet-avx2) name=onnx-avx2 ;;
        parakeet-avx512) name=onnx-avx512 ;;
        onnx-rocm|migraphx) name=onnx-migraphx ;;
        onnx-cuda|cuda) name="onnx-cuda-$(_vt_cuda_major)" ;;
        cuda-12|cuda-13) name="onnx-$name" ;;
    esac
    printf '%s\n' "$name"
}

# Echo the variant the installed /usr/bin/voxtype runs, if it is one of ours.
_vt_active_variant() {
    local tarch=$1 target variant
    target=$(_vt_active_binary)
    case "$target" in
        /usr/lib/voxtype/*) ;;
        *) return 0 ;;
    esac
    variant=$(_vt_normalize "${target##*/}")
    if [[ " $(_vt_known "$tarch") " == *" $variant "* ]]; then
        printf '%s\n' "$variant"
    fi
}

_vt_cpu_tier() {
    local cpuinfo=$_vt_root/proc/cpuinfo
    if grep -qw avx512f "$cpuinfo" 2>/dev/null; then
        echo avx512
    elif grep -qw avx2 "$cpuinfo" 2>/dev/null; then
        echo avx2
    else
        echo baseline
    fi
}

# Choose the variants for arch $1 and set _vt_selected and _vt_explicit (both
# in _vt_variants_<arch> order). _vt_explicit is what package-variants
# records as asked for, so the next build keeps it.
_vt_select() {
    local tarch=$1 want=" " explicit=" " name variant all=0 drop_recorded=0 known
    known=" $(_vt_known "$tarch") "

    local request=${VOXTYPE_VARIANTS:-}
    request=${request//,/ }
    for name in $request; do
        case "$name" in
            all) all=1 ;;
            default) drop_recorded=1 ;;
            *)
                variant=$(_vt_normalize "$name")
                if [[ $known != *" $variant "* ]]; then
                    _vt_die "VOXTYPE_VARIANTS: unknown variant '$name' for $tarch. Valid:$known(or all, default)"
                fi
                explicit+="$variant "
                ;;
        esac
    done

    if (( ${PRINTSRCINFO:-0} )); then
        # .SRCINFO lists every source and checksum regardless of the machine
        # that generates it; makepkg sets PRINTSRCINFO for --printsrcinfo.
        all=1
    fi

    if (( all )); then
        explicit=$known
    elif (( ! drop_recorded )); then
        local record=$_vt_root/usr/lib/voxtype/package-variants recorded=""
        if [[ -f $record ]]; then
            recorded=$(sed -n 's/^explicit=//p' "$record" 2>/dev/null | head -n 1)
        fi
        for name in $recorded; do
            variant=$(_vt_normalize "$name")
            # A recorded name this release no longer ships is dropped quietly.
            if [[ $known == *" $variant "* ]]; then
                explicit+="$variant "
            fi
        done
    fi

    want+="$explicit "
    if [[ $tarch == aarch64 ]]; then
        want+="cpu "
    else
        want+="$(_vt_cpu_tier) baseline vulkan "
    fi
    want+="$(_vt_active_variant "$tarch") "

    _vt_selected=()
    _vt_explicit=()
    for variant in $(_vt_known "$tarch"); do
        if [[ $want == *" $variant "* ]]; then
            _vt_selected+=("$variant")
        fi
        if [[ $explicit == *" $variant "* ]]; then
            _vt_explicit+=("$variant")
        fi
    done
}

# Fill source_<arch>/sha256sums_<arch> from _vt_assets_<arch> for the
# variants in the remaining arguments. Each asset is followed by its .asc
# signature.
_vt_add_sources() {
    local tarch=$1 entry e_variant e_asset e_sum
    shift
    local -n _src="source_$tarch" _sums="sha256sums_$tarch" _table="_vt_assets_$tarch"
    _src=()
    _sums=()
    for entry in "${_table[@]}"; do
        IFS='|' read -r e_variant e_asset e_sum <<<"$entry"
        if [[ $e_variant != common && " $* " != *" $e_variant "* ]]; then
            continue
        fi
        _src+=("voxtype-$pkgver-$e_asset::$_github/voxtype-$_vt_ver-linux-$tarch-$e_asset"
               "voxtype-$pkgver-$e_asset.asc::$_github/voxtype-$_vt_ver-linux-$tarch-$e_asset.asc")
        _sums+=("$e_sum" 'SKIP')
    done
}

_vt_carch=${CARCH:-$(uname -m)}
for _vt_arch in "${arch[@]}"; do
    if [[ $_vt_arch == "$_vt_carch" ]]; then
        _vt_select "$_vt_arch"
        _vt_add_sources "$_vt_arch" "${_vt_selected[@]}"
    else
        # Never downloaded on this machine; list everything so the arrays
        # stay complete for any tool that reads them.
        # shellcheck disable=SC2046 # one argument per variant
        _vt_add_sources "$_vt_arch" $(_vt_known "$_vt_arch")
    fi
done
unset _vt_arch

if (( ! ${PRINTSRCINFO:-0} && ! ${INFAKEROOT:-0} )); then
    printf '  -> %s\n' "voxtype-bin variants: ${_vt_selected[*]} (set VOXTYPE_VARIANTS to add more; see the PKGBUILD header)" >&2
fi

# Install one variant's binary, GGUF worker and companion libraries.
#
# voxtype looks beside its resolved executable (/proc/self/exe) for
# voxtype-gguf-worker-<variant>, then for the generic voxtype-gguf-worker.
# The baseline (x86-64-v2) worker is the generic one on x86_64, so every CPU
# can start it; on aarch64 the cpu worker is. avx2/avx512 get CPU workers;
# vulkan and every ONNX variant get Vulkan-capable workers, which fall back to
# the CPU when no Vulkan device initializes.
#
# GPU ONNX binaries each live in their own subdirectory next to the EP
# companion shared libs they dlopen at runtime. ort 2.0.0-rc.12's CUDA and
# MIGraphX EPs resolve their .so files via /proc/self/exe; if they aren't
# co-located, EP registration fails and ort silently falls back to CPU.
# /proc/self/exe follows symlinks, so the names /usr/lib/voxtype/voxtype-onnx-*
# are symlinks into these subdirs. Each subdir also holds that variant's GGUF
# worker and a symlink to the generic worker.
_vt_install_variant() {
    local v=$1 lib="$pkgdir/usr/lib/voxtype" src="$srcdir/voxtype-$pkgver"
    case "$v" in
        baseline|cpu)
            install -Dm755 "$src-$v" "$lib/voxtype-$v"
            install -Dm755 "$src-$v.gguf-worker" "$lib/voxtype-gguf-worker"
            ;;
        avx2|avx512|vulkan|onnx-avx2|onnx-avx512|onnx)
            install -Dm755 "$src-$v" "$lib/voxtype-$v"
            install -Dm755 "$src-$v.gguf-worker" "$lib/voxtype-gguf-worker-$v"
            ;;
        onnx-cuda-12|onnx-cuda-13|onnx-migraphx)
            local sub=${v#onnx-} so
            install -Dm755 "$src-$v" "$lib/$sub/voxtype-$v"
            install -Dm755 "$src-$v.gguf-worker" "$lib/$sub/voxtype-gguf-worker-$v"
            ln -sf ../voxtype-gguf-worker "$lib/$sub/voxtype-gguf-worker"
            ln -sf "$sub/voxtype-$v" "$lib/voxtype-$v"
            case "$v" in
                onnx-cuda-12|onnx-cuda-13) so="libonnxruntime_providers_cuda.so" ;;
                onnx-migraphx) so="libonnxruntime_providers_migraphx.so" ;;
            esac
            install -Dm644 "$src-$v.$so" "$lib/$sub/$so"
            install -Dm644 "$src-$v.libonnxruntime_providers_shared.so" \
                "$lib/$sub/libonnxruntime_providers_shared.so"
            if [[ $v == onnx-cuda-13 ]]; then
                # cu13 dlopens ORT (ort/load-dynamic): ship Microsoft's
                # libonnxruntime under its SONAME plus the libonnxruntime.so
                # name ort resolves relative to /proc/self/exe.
                install -Dm644 "$src-$v.libonnxruntime.so.1.24.4" \
                    "$lib/$sub/libonnxruntime.so.1.24.4"
                ln -sf libonnxruntime.so.1.24.4 "$lib/$sub/libonnxruntime.so"
            fi
            if [[ $v == onnx-migraphx ]]; then
                # Compatibility name for scripts written before the AMD EP
                # moved from ROCm to MIGraphX in v0.7.0.
                ln -sf voxtype-onnx-migraphx "$lib/voxtype-onnx-rocm"
            fi
            ;;
        *)
            printf '==> ERROR: voxtype-bin: no install rule for variant %s\n' "$v" >&2
            return 1
            ;;
    esac
}

package() {
    local _v
    for _v in "${_vt_selected[@]}"; do
        _vt_install_variant "$_v"
    done

    # /usr/bin/voxtype and the unversioned voxtype-onnx-cuda symlink are
    # created by the .install script's post_install/post_upgrade hooks so
    # they can pick the right CPU tier and CUDA variant for the host.

    # Which variants this build holds, for `voxtype setup` hints and for the
    # next build to keep the ones asked for (contract 2.3 in the 1.2.1 plan).
    {
        printf '# voxtype-bin %s-%s: variants selected when the package was built\n' "$pkgver" "$pkgrel"
        printf 'install_method=aur-bin\n'
        printf 'included=%s\n' "${_vt_selected[*]}"
        printf 'explicit=%s\n' "${_vt_explicit[*]}"
    } > "$pkgdir/usr/lib/voxtype/package-variants"
    chmod 644 "$pkgdir/usr/lib/voxtype/package-variants"

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
    # AudioBridge) registered via qmldir; keep the layout intact or
    # `import voxtype-shared 1.0` fails to resolve.
    # Copy the whole tree so a QML file added upstream can never be missed
    # here (the #697/#762 failure class). Mirrors scripts/package.sh exactly.
    install -d "$pkgdir/usr/share/voxtype"
    cp -a "$srcdir/voxtype-$_vt_ver/quickshell" "$pkgdir/usr/share/voxtype/"
    find "$pkgdir/usr/share/voxtype/quickshell" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/voxtype/quickshell" -type d -exec chmod 755 {} +

    # Omarchy Settings plugin, in the versioned layout every package shares:
    # io.voxtype.settings/<version>/Panel.qml, so each upgrade gives Omarchy
    # a new entry URL. Staged by the same script as deb and rpm. Users link it
    # with `voxtype setup omarchy`, or the daemon links it on first start;
    # this hook runs as root and never touches a home directory.
    bash "$srcdir/voxtype-$_vt_ver/scripts/stage-omarchy-plugin.sh" \
        "$srcdir/voxtype-$_vt_ver/omarchy-plugin" \
        "$pkgdir/usr/share/voxtype/omarchy-plugin"
    local _plugin="$pkgdir/usr/share/voxtype/omarchy-plugin/io.voxtype.settings"
    if [[ ! -f $_plugin/$_vt_ver/Panel.qml ]] ||
        ! grep -q "\"version\"[[:space:]]*:[[:space:]]*\"$_vt_ver\"" "$_plugin/manifest.json"; then
        printf '==> ERROR: voxtype-bin: the Omarchy plugin manifest does not match version %s\n' \
            "$_vt_ver" >&2
        return 1
    fi

    # OSD style packages and recipes. The style resolver searches
    # /usr/share/voxtype/osd/<name> after the user paths, so shipping the
    # example packages gives [osd] style = "<name>" something to resolve out
    # of the box; a user copy in ~/.config or ~/.local/share still shadows
    # them. Whole trees from the same source tarball, no extra sources.
    install -d "$pkgdir/usr/share/voxtype/osd" "$pkgdir/usr/share/voxtype/osd-recipes"
    cp -a "$srcdir/voxtype-$_vt_ver/examples/osd-packages/." "$pkgdir/usr/share/voxtype/osd/"
    find "$pkgdir/usr/share/voxtype/osd" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/voxtype/osd" -type d -exec chmod 755 {} +
    cp -a "$srcdir/voxtype-$_vt_ver/examples/osd-recipes/." "$pkgdir/usr/share/voxtype/osd-recipes/"
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

    # Install documentation. THIRD_PARTY.md (from the signed source archive)
    # carries the attribution for bundled models and data, as the deb does.
    install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/voxtype-$_vt_ver/THIRD_PARTY.md" \
        "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"

    # Install license
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 "$srcdir/voxtype-$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"
}
