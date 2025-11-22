# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rav1d-git
pkgver=1.1.0.r160.ga90f3de5
pkgrel=1
pkgdesc='An AV1 cross-platform decoder (git version)'
arch=('x86_64')
url='https://github.com/memorysafety/rav1d/'
license=('BSD-2-Clause')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cargo'
    'git'
    'nasm')
checkdepends=(
    'meson')
provides=('rav1d')
conflicts=('rav1d')
source=('git+https://github.com/memorysafety/rav1d.git'
        'rav1d.pc.in')
sha256sums=('SKIP'
            '8d269daccf97683eb663264a9f3062c86184acb87129fed5d246adbfb730de32')

prepare() {
    cp -f rav1d.pc{.in,}
    sed -i "s/@RAV1D_VERSION@/${pkgver%%.r*}/" rav1d.pc
    
    export RUSTUP_TOOLCHAIN='stable'
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path='rav1d/Cargo.toml'
}

pkgver() {
    git -C rav1d describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo build --release --frozen --all-features --manifest-path='rav1d/Cargo.toml'
}

check() {
    cd rav1d
    .github/workflows/test.sh -r "${srcdir}/target/release/dav1d"
}

package() {
    install -D -m755 target/release/dav1d "${pkgdir}/usr/bin/rav1d"
    install -D -m644 target/release/librav1d.a -t "${pkgdir}/usr/lib"
    install -D -m644 rav1d.pc -t "${pkgdir}/usr/lib/pkgconfig"
    install -D -m644 rav1d/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
