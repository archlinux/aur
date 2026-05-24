# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>

pkgname=monsoon-git
_pkgname=monsoon
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="bittorrent client (daemon + cli + tui) built on libtorrent-rasterbar"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/5unekku/monsoon"
license=('GPL-3.0-only')
depends=('libtorrent-rasterbar' 'gcc-libs' 'glibc' 'curl')
makedepends=('git' 'cargo' 'boost' 'clang')
optdepends=(
    'systemd: user service included — enable with: systemctl --user enable --now monsoon'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# disable LTO: makepkg's default `lto` option injects -Clinker-plugin-lto
# into RUSTFLAGS, which breaks ffi to C/asm code (ring, our libtorrent
# bridge). symptom is undefined symbols at final link for every C-derived
# function. revisit if we ever ship a pure-rust dep tree.
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    # cargo version + commit count since tag + short hash
    # produces something like 0.1.0.r42.gabc1234
    printf "%s.r%s.g%s" \
        "$(awk -F\" '/^version/ {print $2; exit}' Cargo.toml)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"

    # ── env diagnostics (printed to stderr) ──────────────────────────────
    # makes cross-machine failures easier to triage. cheap; runs once.
    {
        echo "[monsoon-git build env]"
        echo "  rustc:       $(rustc --version 2>&1 || echo unknown)"
        echo "  cargo:       $(cargo --version 2>&1 || echo unknown)"
        echo "  cc:          $(cc --version 2>&1 | head -1 || echo unknown)"
        echo "  c++:         $(c++ --version 2>&1 | head -1 || echo unknown)"
        echo "  libtorrent:  $(pkg-config --modversion libtorrent-rasterbar 2>/dev/null || echo 'pkg-config miss')"
        echo "  boost hdrs:  $(test -f /usr/include/boost/config.hpp && echo present || echo MISSING)"
        echo "  RUSTFLAGS:   ${RUSTFLAGS:-(unset)}"
        echo "  CFLAGS:      ${CFLAGS:-(unset)}"
        echo "  CXXFLAGS:    ${CXXFLAGS:-(unset)}"
        echo "  LDFLAGS:     ${LDFLAGS:-(unset)}"
        echo "  CARGO_PROFILE_RELEASE_LTO: ${CARGO_PROFILE_RELEASE_LTO:-(unset)}"
    } >&2

    # belt-and-suspenders against env-injected RUSTFLAGS / LTO settings.
    # options=('!lto') above tells makepkg not to add LTO flags; these
    # additionally override anything in ~/.cargo/config.toml or shell env
    # that might re-enable it. C/asm ffi (ring, our libtorrent bridge)
    # silently lose symbols under LTO.
    unset RUSTFLAGS CARGO_BUILD_RUSTFLAGS
    export CARGO_PROFILE_RELEASE_LTO=off
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16

    export RUSTUP_TOOLCHAIN=stable
    # cache target/ OUTSIDE paru's clone dir. paru runs `git clean -fdx`
    # between -S invocations, which would wipe an in-tree target/ on every
    # build. parking it under $HOME/.cache/cargo-builds/ lets cargo's
    # incremental + dep cache survive reinstalls. typical second build
    # with no source change <5s; with small edits <30s. first build still
    # pays the full ~2min compile.
    #
    # one-time recovery if cargo's state ever gets corrupt:
    #   rm -rf ~/.cache/cargo-builds/monsoon-git
    export CARGO_TARGET_DIR="${HOME}/.cache/cargo-builds/monsoon-git"
    mkdir -p "${CARGO_TARGET_DIR}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm755 "${HOME}/.cache/cargo-builds/monsoon-git/release/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 contrib/systemd/monsoon.service \
        "${pkgdir}/usr/lib/systemd/user/monsoon.service"
}
