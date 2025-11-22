# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rav1d
pkgver=1.1.0
pkgrel=1
pkgdesc='An AV1 cross-platform decoder'
arch=('x86_64')
url='https://github.com/memorysafety/rav1d/'
license=('BSD-2-Clause')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cargo'
    'nasm')
checkdepends=(
    'meson')
source=("https://github.com/memorysafety/rav1d/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-rav1d-fix-warnings-with-newer-toolchains.patch'
        'rav1d.pc.in')
sha256sums=('464399004fb5bee61d94ec24726e488d373a13dadf5147b0f7c9b1887959d0cb'
            '77eda6330c304207b21a99fa0b2ba96c7ac71ec26c9983693366715bb5fc1394'
            '8d269daccf97683eb663264a9f3062c86184acb87129fed5d246adbfb730de32')

prepare() {
    cp -f rav1d.pc{.in,}
    sed -i "s/@RAV1D_VERSION@/${pkgver}/" rav1d.pc
    
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-rav1d-fix-warnings-with-newer-toolchains.patch"
    
    export RUSTUP_TOOLCHAIN='stable'
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

build() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo build --release --frozen --all-features --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

check() {
    cd "${pkgname}-${pkgver}"
    .github/workflows/test.sh -r "${srcdir}/target/release/dav1d"
}

package() {
    install -D -m755 target/release/dav1d "${pkgdir}/usr/bin/rav1d"
    install -D -m644 target/release/librav1d.a -t "${pkgdir}/usr/lib"
    install -D -m644 rav1d.pc -t "${pkgdir}/usr/lib/pkgconfig"
    install -D -m644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
