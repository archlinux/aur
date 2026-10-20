# Maintainer: edwloef

pkgname=generic-daw-git
_pkgname=generic-daw
pkgver=r1934.33f3ecb6
pkgrel=1
pkgdesc="An early-in-development, open source, cross-platform digital audio workstation (DAW) built in Rust."
arch=('x86_64')
url="https://github.com/generic-daw/generic-daw"
license=("GPL-3.0-only")
makedepends=("alsa-lib" "cargo" "clang" "git" "libpipewire")
provides=("${_pkgname}" "clap-host")
conflicts=("${_pkgname}")
options=(!lto)
source=(
    "git+https://github.com/generic-daw/generic-daw.git"
    "lucide-static-1.33.0.ttf::https://unpkg.com/lucide-static@1.33.0/font/Lucide.ttf"
)
sha256sums=(
    SKIP
    "ef5dcd7e5d79d3d1ac729615f7d2672eab02adb5915054ab0b6545563a730248"
)

pkgver() {
    cd "${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"

    install ../lucide-static-1.33.0.ttf Lucide.ttf

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}"

    install -Dm755 "target/release/generic_daw" "${pkgdir}/usr/bin/generic_daw"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/generic-daw.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Generic DAW
Exec=generic_daw
Terminal=false
Categories=AudioVideo;Audio;Midi;Music;
EOF
}
