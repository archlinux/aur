# Maintainer: Peter Jackson <pete@peteonrails.com>
# Contributor: Carmine Paolino <carmine@paolino.me>
pkgname=voxtype
pkgver=1.3.2
pkgrel=2
pkgdesc="Push-to-talk voice-to-text for Linux (optimized for Wayland, works on X11)"
arch=('x86_64' 'aarch64')
url="https://voxtype.io"
license=('MIT')
depends=('alsa-lib' 'bash' 'curl' 'glibc' 'libgcc' 'libstdc++')
makedepends=(
    'cargo'
    'clang'
    'cmake'
    'git'
    'pkgconf'
    'shaderc'
    'spirv-headers'
    'vulkan-headers'
    'vulkan-icd-loader'
    'gtk4'
    'gtk4-layer-shell'
    'wayland'
    'libxkbcommon'
)
optdepends=(
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: Wayland clipboard support'
    'xdotool: X11 keyboard simulation'
    'xclip: X11 clipboard support'
    'libnotify: desktop notifications'
    'pipewire-alsa: ALSA compatibility for PipeWire'
    'pulseaudio-alsa: ALSA compatibility for PulseAudio'
    'vulkan-icd-loader: GPU acceleration for Whisper and GGUF models, and native OSD rendering'
    'onnxruntime>=1.24.0: CPU inference for the ONNX engines'
    'gtk4: GTK4 OSD frontend and meetings window'
    'gtk4-layer-shell: GTK4 OSD frontend'
    'cairo: GTK4 OSD frontend'
    'glib2: GTK4 OSD frontend'
    'wayland: native OSD frontend'
    'libxkbcommon: native OSD frontend'
    'libglvnd: OpenGL rendering for the native OSD frontend'
    'quickshell: Quickshell OSD frontend'
    'qt6-declarative: Quickshell OSD frontend'
    'ollama: local AI summarization for meeting mode'
    'libpulse: capture of the other side of a call in meeting mode (parec, pactl)'
    'ffmpeg: meeting audio import, retention and playback'
    'xdg-utils: open shared meetings and links from the meeting view'
    'bubblewrap: sandbox for the meeting assistant'
)
# voxtype-bin and voxtype-git already conflict with 'voxtype'; naming them
# here as well lets pacman offer the swap from either direction.
conflicts=('voxtype-bin' 'voxtype-bin-rc' 'voxtype-git')
backup=('etc/voxtype/config.toml')
# whisper.cpp mixes C/C++ with Rust; avoid cross-language LTO. A debug
# package of eight large binaries is gigabytes that AUR users do not want.
options=('!lto' '!debug')
install=voxtype.install
validpgpkeys=(
    # Offline maintainer primary (Peter Jackson). Signed legacy assets
    # through v0.7.4 and cross-signed the CI primary below.
    'E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6'
    # Voxtype CI release signing primary. Signs the GitHub auto-archive
    # source tarball starting in v0.7.5. Auto-fetchable by fingerprint
    # via dirmngr from keys.openpgp.org / keyserver.ubuntu.com, so first
    # install on a fresh system has no manual gpg --recv-keys step.
    '9CCF7915B750CAE8B095ED1AA3FC9F33FD209279'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc::https://github.com/peteonrails/voxtype/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
    'c98cd433872e30de57c3b48756ec1177404f07ebd7f65a4bd9116d7310240841'
    'SKIP'
)

# Run cargo with its final and intermediate artifacts both in one target
# directory under the source tree. Upstream requires that GPU feature sets
# never share build artifacts, and a build.build-dir set in the packager's
# own cargo config would otherwise pool every feature set's intermediates
# outside $srcdir.
_cargo_in() {
    local _dir="$srcdir/$pkgname-$pkgver/$1"
    shift
    CARGO_TARGET_DIR="$_dir" CARGO_BUILD_BUILD_DIR="$_dir" cargo "$@"
}

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_PROFILE_RELEASE_LTO=false
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=8
    export CC=clang
    export CXX=clang++
    export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-4}"
    # build.rs stamps `git rev-parse HEAD` into --version when it finds a
    # repo. A tarball has none, but git would walk up into the AUR clone
    # makepkg runs in and stamp the packaging repo's commit (1.3.0+g<aur-sha>).
    export GIT_CEILING_DIRECTORIES="$srcdir"
    # Rust panic locations and whisper.cpp diagnostics otherwise embed
    # the packager's working directory even in stripped release binaries.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir/="
    export CFLAGS="${CFLAGS} -ffile-prefix-map=$srcdir/="
    export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=$srcdir/="
    # makepkg exports SOURCE_DATE_EPOCH, and ggml turns its native tuning off
    # when that is set without enabling any other instruction set, so
    # whisper.cpp would be compiled for plain x86-64. Ask for the build
    # machine's CPU explicitly. To build a package for other machines, set
    # GGML_NATIVE=OFF and the GGML_* instruction sets they share.
    export GGML_NATIVE="${GGML_NATIVE:-ON}"

    # Every daemon carries the client for GGUF models (Parakeet and Cohere
    # .gguf files); gpu-vulkan implies it. The models run in
    # voxtype-gguf-worker, a separate crate because transcribe.cpp and
    # whisper.cpp each bring their own ggml.
    local _gguf=gguf,cohere-gguf,parakeet-gguf

    _cargo_in target build --frozen --release --bin voxtype --features "$_gguf"
    # CPU worker, installed under the generic name every variant falls
    # back to. .cargo/config.toml holds its transcribe.cpp build at AVX2.
    _cargo_in target build --frozen --release -p voxtype-gguf-worker

    _cargo_in target-vulkan build --frozen --release --bin voxtype --features gpu-vulkan
    # voxtype-vulkan looks beside itself for voxtype-gguf-worker-vulkan.
    _cargo_in target-vulkan build --frozen --release -p voxtype-gguf-worker --features vulkan

    # Dynamic loading needs no ONNX Runtime at build time. Always build
    # the same engines; users install the optional runtime to use them.
    _cargo_in target-onnx build --frozen --release --bin voxtype \
        --features "parakeet-load-dynamic,moonshine,sensevoice,paraformer,dolphin,omnilingual,cohere,ml-diarization,$_gguf"

    # The OSD frontends, the audio bridge and the meetings window do not
    # link a GPU backend, so they share the CPU build's directory.
    _cargo_in target build --frozen --release \
        --bin voxtype-osd \
        --bin voxtype-osd-gtk4 \
        --bin voxtype-osd-native \
        --bin voxtype-osd-quickshell \
        --bin voxtype-audio-bridge \
        --bin voxtype-meetings-gtk4 \
        --features osd-gtk4,osd-native,meetings-gtk4

    # Man pages, rendered the way the other packages render them. xtask
    # compiles only clap and clap_mangen.
    _cargo_in target --frozen xtask man target/man
}

check() {
    cd "$pkgname-$pkgver"
    # Tests write the daemon's runtime files (state, markers, sockets), so
    # give them their own directory instead of the builder's
    # $XDG_RUNTIME_DIR, where a running voxtype daemon keeps its state.
    export XDG_RUNTIME_DIR="$srcdir/test-runtime"
    rm -rf "$XDG_RUNTIME_DIR"
    install -d -m 700 "$XDG_RUNTIME_DIR"
    export RUSTUP_TOOLCHAIN=stable
    export CC=clang
    export CXX=clang++
    export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-4}"
    export GIT_CEILING_DIRECTORIES="$srcdir"
    # The meeting assistant's jail test runs bwrap whenever it is installed,
    # and gtk4 pulls bubblewrap in. The jail needs unprivileged user
    # namespaces and a fresh /proc, which containers, some chroots and
    # hardened kernels do not allow; skip that one test there instead of
    # failing the build. Probe with the jail's own flags: a bare bwrap can
    # run where mounting /proc is refused.
    local _skip=()
    if ! bwrap --unshare-all --share-net --ro-bind / / --proc /proc --dev /dev true 2>/dev/null; then
        _skip=(--skip meeting::assistant::tests::codex_runs_in_a_jail_that_hides_home)
    fi
    # Include both waveform implementations and the meetings window.
    # Model-dependent inference tests remain opt-in, as in upstream's
    # regular test suite.
    _cargo_in target test --frozen --lib --bins --tests \
        --features osd-gtk4,osd-native,meetings-gtk4 -- "${_skip[@]}"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/voxtype \
        "$pkgdir/usr/lib/voxtype/voxtype-native"
    install -Dm755 target-vulkan/release/voxtype \
        "$pkgdir/usr/lib/voxtype/voxtype-vulkan"
    install -Dm755 target-onnx/release/voxtype \
        "$pkgdir/usr/lib/voxtype/voxtype-onnx"
    install -Dm755 target/release/voxtype-gguf-worker \
        "$pkgdir/usr/lib/voxtype/voxtype-gguf-worker"
    install -Dm755 target-vulkan/release/voxtype-gguf-worker \
        "$pkgdir/usr/lib/voxtype/voxtype-gguf-worker-vulkan"
    # The voxtype-osd launcher probes its own directory for the frontends,
    # and `voxtype meeting view` finds the meetings window beside the daemon.
    install -Dm755 -t "$pkgdir/usr/lib/voxtype" \
        target/release/voxtype-osd \
        target/release/voxtype-osd-gtk4 \
        target/release/voxtype-osd-native \
        target/release/voxtype-osd-quickshell \
        target/release/voxtype-meetings-gtk4
    install -Dm755 target/release/voxtype-audio-bridge \
        "$pkgdir/usr/bin/voxtype-audio-bridge"
    # /usr/bin/voxtype is created by the install script; see the note there.
    ln -s /usr/lib/voxtype/voxtype-osd "$pkgdir/usr/bin/voxtype-osd"

    # Quickshell QML, OSD style packages and OSD recipes, copied as whole
    # trees. A list of files or directories goes stale as soon as upstream
    # adds one (quickshell/voxtype-meetings arrived with 1.3.0), and a QML
    # module with a file missing does not load.
    local _tree _dest
    for _tree in quickshell:quickshell examples/osd-packages:osd examples/osd-recipes:osd-recipes; do
        _dest="$pkgdir/usr/share/voxtype/${_tree#*:}"
        install -d "$_dest"
        cp -a "${_tree%%:*}/." "$_dest/"
        find "$_dest" -mindepth 1 \( -name '.*' -o -name '*~' \) -prune -exec rm -rf {} +
        find "$_dest" -type d -exec chmod 755 {} +
        find "$_dest" -type f -exec chmod 644 {} +
    done

    # Omarchy Settings panel, staged by the script every package uses. It
    # puts the QML in a directory named after the plugin manifest's version.
    bash scripts/stage-omarchy-plugin.sh omarchy-plugin \
        "$pkgdir/usr/share/voxtype/omarchy-plugin"

    install -Dm755 packaging/scripts/voxtype-configure-launcher \
        "$pkgdir/usr/bin/voxtype-configure-launcher"
    install -Dm644 -t "$pkgdir/usr/share/applications" \
        packaging/voxtype-configure.desktop \
        packaging/voxtype-meetings.desktop
    # The icon the desktop entries and notifications ask for by name.
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/voxtype.svg"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/voxtype.png"
    install -Dm644 config/default.toml "$pkgdir/etc/voxtype/config.toml"
    install -Dm644 packaging/systemd/voxtype.service \
        "$pkgdir/usr/lib/systemd/user/voxtype.service"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
        README.md docs/INSTALL.md THIRD_PARTY.md
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 packaging/completions/voxtype.bash \
        "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 packaging/completions/voxtype.zsh \
        "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 packaging/completions/voxtype.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"

    install -Dm644 -t "$pkgdir/usr/share/man/man1" target/man/*.1
}
