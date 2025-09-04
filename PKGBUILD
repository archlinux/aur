# Maintainer: taotieren <admin@taotieren.com>

pkgbase=img2kvm-rs-git
pkgname=img2kvm-rs-git
pkgver=0.2.0.r0.g1c857ab
pkgrel=3
pkgdesc="A utility that convert disk image in Proxmox VE."
arch=('x86_64')
url="https://github.com/ywjno/img2kvm-rs"
license=('MIT')
provides=(${pkgbase%-git} ${pkgbase%-rs-git})
conflicts=(${pkbase%-git} ${pkgbase%-rs-git})
replaces=()
depends=(
    bzip2
    gcc-libs
    glibc
    xz)
makedepends=(
    'git'
    'cargo'
)
optdepend=('qemu-img: QEMU tooling for manipulating disk images'
    'Proxmox VE: qm')
backup=()
options=('!strip' '!lto' '!debug')
install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
