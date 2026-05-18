# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>

pkgname=monsoon-git
_pkgname=monsoon
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="bittorrent client (daemon + cli + tui) built on libtorrent-rasterbar"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/5unekku/monsoon"
license=('GPL-3.0-only')
depends=('libtorrent-rasterbar' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'boost' 'clang')
optdepends=(
    'curl: fetch torrents from http(s)/ftp(s) URLs and refresh ip filter blocklists'
    'systemd: for the user service (monsoon service install)'
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
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # defensive: paru caches the clone dir between builds. if a previous
    # attempt died partway through, cargo's incremental state can keep
    # bridge.cpp out-of-date relative to its build outputs, causing
    # mysterious undefined-symbol errors. wipe target/ to guarantee fresh.
    rm -rf target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
