# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch-git
pkgver=v0.5.4.r7.g1757b3c
pkgrel=2
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs" "pciutils" "libdrm")
optdepends=("dbus: Required for the music module")
makedepends=("cargo" "git")
provides=("crabfetch")
conflicts=("crabfetch")
source=("$pkgname::git+https://github.com/LivacoNew/CrabFetch")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
	cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cd "${srcdir}/${pkgname}"
    # If you don't want to use dbus, remove the music feature flag!
    # Since this is an *arch* package, I'm assuming you are however
    cargo build --frozen -r -F music
}

check() {
    export RUSTUP_TOOLCHAIN=stable
	cd "${srcdir}/${pkgname}"
    cargo test --frozen -F music
}

package() {
	cd "${srcdir}/${pkgname}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crab-fetch ${pkgdir}/usr/bin/crabfetch
    install -Dm 755 ./LICENCE ${pkgdir}/usr/share/licenses/crabfetch/LICENCE
}
