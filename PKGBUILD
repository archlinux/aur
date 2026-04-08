# Maintainer: Hornfisk <billgateway@protonmail.com>
pkgname=vgalizer-git
_pkgname=vgalizer
pkgver=r0.0000000
pkgrel=1
pkgdesc="Lightweight GPU-accelerated audio-reactive DJ visualizer (git master)"
arch=('x86_64')
url="https://github.com/Hornfisk/vgalizer"
license=('MIT')
depends=(
    'vulkan-icd-loader'
    'alsa-lib'
    'fontconfig'
    'libxkbcommon'
)
optdepends=(
    'libpulse: PulseAudio capture via parec (PA: device prefix)'
    'pipewire: native PipeWire capture via pw-cat (PW: device prefix)'
    'vulkan-radeon: Vulkan driver for AMD GPUs'
    'vulkan-intel: Vulkan driver for Intel GPUs'
    'nvidia-utils: Vulkan driver for NVIDIA GPUs'
)
makedepends=('git' 'rust')
provides=("$_pkgname" 'vje')
conflicts=("$_pkgname" 'vje')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
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
    cargo build --frozen --release --bins
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # shader_compile test skips gracefully when no GPU adapter is present,
    # so this is safe under clean-chroot builds (makechrootpkg).
    cargo test --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/vgalizer" "$pkgdir/usr/bin/vgalizer"
    install -Dm755 "target/release/vje"      "$pkgdir/usr/bin/vje"
    install -Dm644 "LICENSE"                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md"               "$pkgdir/usr/share/doc/$pkgname/README.md"
}
