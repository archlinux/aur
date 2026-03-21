# Maintainer: HeyCitizen <HeyCitizen@HeyCitizen.xyz>

pkgname=podping-alpha-gossip-listener-git
pkgver=r112.7facd0b
pkgrel=1
pkgdesc="Decentralized podcast feed notification listener"
arch=("x86_64" "aarch64")
url="https://github.com/Podcastindex-org/podping.alpha"
license=("MIT")
depends=("gcc-libs" "glibc" "openssl")
makedepends=("cargo" "gcc" "git")
backup=("etc/conf.d/podping-alpha-gossip-listener")
install="podping-alpha-gossip-listener.install"
options=(!debug !lto)
provides=("podping-alpha-gossip-listener")
conflicts=("podping-alpha-gossip-listener")
source=(
    "git+https://github.com/Podcastindex-org/podping.alpha.git"
    "podping-alpha-gossip-listener.conf"
    "podping-alpha-gossip-listener.service"
    "podping-alpha-gossip-listener.sysusers"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
)

pkgver() {
    cd "${srcdir}/podping.alpha"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/podping.alpha/gossip-listener"
    cargo generate-lockfile
}

_set_rust_linker() {
    case "${CARCH}" in
        x86_64)
            export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="/usr/bin/gcc"
            ;;
        aarch64)
            export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER="/usr/bin/gcc"
            ;;
    esac
}

build() {
    cd "${srcdir}/podping.alpha/gossip-listener"
    _set_rust_linker
    cargo build --release --locked
}

check() {
    cd "${srcdir}/podping.alpha/gossip-listener"
    _set_rust_linker
    cargo check --release --locked
}

package() {
    cd "${srcdir}/podping.alpha"

    install -Dm755 "gossip-listener/target/release/gossip-listener" \
        "${pkgdir}/usr/bin/gossip-listener"

    install -Dm644 "gossip-listener/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.conf" \
        "${pkgdir}/etc/conf.d/podping-alpha-gossip-listener"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.service" \
        "${pkgdir}/usr/lib/systemd/system/podping-alpha-gossip-listener.service"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/podping-alpha-gossip-listener.conf"
}
