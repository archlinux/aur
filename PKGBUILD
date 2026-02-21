# Maintainer: Fuero <fuerob@gmail.com>

pkgname=postdad
_pkgname=PostDad
# renovate: datasource=github-releases depName=mega123-art/PostDad
pkgver=0.3.1
pkgrel=1
pkgdesc='fast API client for your terminal'
url='https://github.com/mega123-art/PostDad'
license=('MIT')
makedepends=('cargo')
depends=('openssl' 'oniguruma')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('60c77de366be6116cc67b425ebe4fe031c51fa35788faecb99343f4123506a5200166657cc3712c5a3325576c5539a7758ae4f28e23799a0e6be189b6a2e14da')

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    RUSTONIG_DYNAMIC_LIBONIG=1 cargo build --frozen --release --all-features --verbose
}

check() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features || true
}

package() {
    cd "${_pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    install -m0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}" 
    for i in *.md
    do
      install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}

