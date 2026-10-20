# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=libloot
pkgname="python-${_pkgname}"
pkgver=0.29.7
pkgrel=1
pkgdesc='An experimental Python wrapper around libloot'
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/loot/${_pkgname}/archive/${pkgver}.tar.gz")
depends=('python>=3.8')
makedepends=('cargo' 'maturin' 'python-installer')
sha256sums=('ed168a13ba42b353e6bb863f0b85f14295a951ec210b19ae8893b27c4681c7a6')

prepare() {
    cd "${_pkgname}-${pkgver}/python"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${_pkgname}-${pkgver}/python"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    maturin build --locked --release --target "$(rustc --print host-tuple)" --strip --compatibility linux
}

package() {
    cd "${_pkgname}-${pkgver}/python"

    install -Dm0644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    python -m installer -d "$pkgdir" target/wheels/libloot-"$pkgver"*.whl

    find "$pkgdir" -type f -name "*.cyclonedx.json" -exec sed -i "s|$srcdir|/build|g" {} +
}
