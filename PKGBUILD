# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.5.5
pkgrel=1
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs" "pciutils" "libdrm")
optdepends=("dbus: Required for the music module")
makedepends=("cargo")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('07d4f4a84980542253f8ce39730c1066c7264236cab557276c4748a13dbf4803b136dc1efc9a62cf1c2d5b0fb0b70140b1ae06ec707812b8f9246f7d88586592')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/CrabFetch-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/CrabFetch-${pkgver}"
    # If you don't want to use dbus, remove the music feature flag!
    # Since this is an *arch* package, I'm assuming you are however
    cargo build --frozen -r -F music
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/CrabFetch-${pkgver}"
    cargo test --frozen -F music
}

package() {
    cd "${srcdir}/CrabFetch-${pkgver}"
    install -Dm 755 ./target/release/crab-fetch ${pkgdir}/usr/bin/crabfetch
    install -Dm 755 ./LICENCE ${pkgdir}/usr/share/licenses/crabfetch/LICENCE
}
