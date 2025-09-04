# Maintainer: taotieren <admin@taotieren.com>

pkgbase=img2kvm-rs
pkgname=img2kvm-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="A utility that convert disk image in Proxmox VE."
arch=('x86_64')
url="https://github.com/ywjno/img2kvm-rs"
license=('MIT')
provides=(${pkgbase} ${pkgbase%-rs})
conflicts=(${pkbase} ${pkgbase%-rs})
replaces=()
depends=(
    bzip2
    gcc-libs
    glibc
    xz
)
makedepends=(
    'git'
    'cargo'
)
optdepend=('qemu-img: QEMU tooling for manipulating disk images'
    'Proxmox VE: qm')
backup=()
options=('!strip' '!lto' '!debug')
install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('55da12e9779b3c5bb8d492a918d9310417f156596adf5928121a3aa7b7da022f')

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
