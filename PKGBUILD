# Maintainer: Smigz smiggiddy at gmail dot com

_pkgname=sofka
pkgname=sofka-git
pkgdesc="A Kubernetes TUI, reimagined in Rust"
pkgver=0.30.0.r0.gbc1e3a7
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/nklmilojevic/${_pkgname}"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
# makepkg's LTO adds -flto=auto to CFLAGS, which mangles the C/asm objects
# ring builds and leaves ring_core_* symbols undefined at link time. Rust
# code still gets thin LTO from upstream's [profile.release]. !debug because
# that same profile sets strip = true, so a debug package holds no symbols.
options=('!lto' '!debug')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    # v0.24.9-5-gabc1234 -> 0.24.9.r5.gabc1234
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# aws-lc-sys (TLS backend since upstream d70417a) compiles jitterentropy with
# -O0 and hard-errors on any optimization, but cc-rs appends makepkg's CFLAGS
# after its own flags, so our -O2 wins. Strip -O levels; cc-rs still passes
# its own -O3 for everything else.
_strip_cflags_opt() {
    local v
    for v in CFLAGS "CFLAGS_${CARCH}_unknown_linux_gnu"; do
        if [[ -n "${!v}" ]]; then
            export "$v=$(sed -E 's/(^| )-O[0-9sgz]?( |$)/ /g' <<<"${!v}")"
        fi
    done
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    _strip_cflags_opt
    cargo build --frozen --release
}

check() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    _strip_cflags_opt
    # The suite builds a rustls-backed kube client even for its fake cluster,
    # so it needs the native root CAs from ca-certificates (present in a
    # devtools chroot). No network or real cluster is required.
    #
    # help_cache_tracks_inputs_and_reuses_lines_when_scrolling compares frames
    # drawn while scrollbars are visible, which they are for only 700ms after
    # a scroll key. Under a loaded parallel suite the test can outlive that
    # window between two compared draws and fail spuriously.
    cargo test --frozen -- \
        --skip ui::tests::help_cache_tracks_inputs_and_reuses_lines_when_scrolling
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" docs/*.md
}
