# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.6.4
pkgrel=1
arch=('x86_64')
depends=(
    'rust'
    'cargo'
    'openssl'
)
makedepends=(
    'cmake'
    'clang'
)
source=(
    "https://github.com/helium/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/helium/helium-wallet-rs/pull/172/commits/818f1648f6f532ee529db3354579b1219d2b2a52.patch"
)
sha512sums=('dddb5867e5238681658c9cc0d50a3a5fc7f48734cc21a2d3e6fedf508c0410f0b5b5be48935b6a8c2b475a8fc29d3452630d3eeb234c92ccc89ef3b80ff485dd'
            '2868cdbba25b76fca5fc3570f6a6b41348710179a15a36afd0c53580eb0cad8b42aa0c5c0ace17382c3dfa7ee9b0b7f371e3fcf7bd42ddac0698a3b7191ed14e')

prepare() {
    cd ${_pkgname}-${pkgver}
    # Drop this on v1.6.5 or later release, this fixes dependency breakage
    # which is still not tagged.
    patch --forward --strip=1 --input="${srcdir}/818f1648f6f532ee529db3354579b1219d2b2a52.patch"
}

build() {
    cd ${_pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${_pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${_pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" bin/helium-wallet
}
