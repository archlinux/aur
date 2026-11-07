# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synaptix-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synaptix neural-network service: language models, speech, images and video for all apps — on NVIDIA GPU, Intel NPU or CPU'
depends=('gcc-libs')
optdepends=('nvidia-utils: NVIDIA driver (NVENC, neural networks on the GPU)'
            'cuda: NVRTC kernel compiler for NVIDIA GPUs'
            'openvino-intel-npu-plugin: neural networks on Intel NPU (Core Ultra)'
            'intel-npu-driver: Intel NPU driver'
            'intel-npu-compiler: Intel NPU graph compiler')
provides=('synaptix')
conflicts=('synaptix' 'synaptix-bin')
backup=('etc/synaptix/synaptixd.toml')
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'ffmpeg' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3')
options=('!lto')
source=("synshell::git+https://github.com/VitaminDB/synshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/synshell"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '%s.r%s.g%s' '0.2.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p synaptixd --bins --features synaptixd/cuda,synaptixd/npu
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/synaptixd" "$pkgdir/usr/bin/synaptixd"
    install -Dm755 "$_bins/synaptixctl" "$pkgdir/usr/bin/synaptixctl"
    install -dm755 "$pkgdir/usr/share/synaptix/models"
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/synaptixd/data/synaptixd.service'; do
        [ -e "$_f" ] || { echo "нет crates/synaptixd/data/synaptixd.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
    install -dm755 "$pkgdir/etc/synaptix/"
    for _f in 'crates/synaptixd/data/synaptixd.toml'; do
        [ -e "$_f" ] || { echo "нет crates/synaptixd/data/synaptixd.toml" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/etc/synaptix/"; else install -m644 "$_f" "$pkgdir/etc/synaptix/"; fi
    done
    install -dm755 "$pkgdir/usr/share/doc/synaptix/"
    for _f in 'docs/MODELS.md'; do
        [ -e "$_f" ] || { echo "нет docs/MODELS.md" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/doc/synaptix/"; else install -m644 "$_f" "$pkgdir/usr/share/doc/synaptix/"; fi
    done
}
