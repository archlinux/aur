# Maintainer: HeyCitizen <HeyCitizen@HeyCitizen.xyz>

pkgname=podping-alpha-gossip-listener-git
_pkgname=podping-gossipwatcher
pkgver=r14.ea84450
pkgrel=1
pkgdesc="Decentralized podcast feed notification listener"
arch=("x86_64" "aarch64")
url="https://github.com/Podcastindex-org/podping-gossipwatcher"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "gcc" "git")
backup=("etc/conf.d/podping-alpha-gossip-listener")
install="podping-alpha-gossip-listener.install"
options=(!debug !lto)
provides=("podping-alpha-gossip-listener")
conflicts=("podping-alpha-gossip-listener")
source=(
    "git+${url}.git"
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
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
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
    cd "${srcdir}/${_pkgname}"
    _set_rust_linker
    cargo build --release
}

check() {
    cd "${srcdir}/${_pkgname}"
    _set_rust_linker
    cargo check --release
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Upstream renamed the crate and binary to podping-gossipwatcher; the
    # installed name stays gossip-listener so the existing unit keeps working.
    install -Dm755 "target/release/podping-gossipwatcher" \
        "${pkgdir}/usr/bin/gossip-listener"

    install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.conf" \
        "${pkgdir}/etc/conf.d/podping-alpha-gossip-listener"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.service" \
        "${pkgdir}/usr/lib/systemd/system/podping-alpha-gossip-listener.service"

    install -Dm644 "${srcdir}/podping-alpha-gossip-listener.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/podping-alpha-gossip-listener.conf"

    install -dm750 -o podping -g podping "${pkgdir}/var/cache/podping"
}
