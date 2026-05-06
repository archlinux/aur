# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=libloot
pkgname="python-${_pkgname}"
pkgver=0.29.5
pkgrel=1
pkgdesc='An experimental Python wrapper around libloot'
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/loot/${_pkgname}/archive/${pkgver}.tar.gz")
depends=('python>=3.8')
makedepends=('cargo' 'maturin' 'python-installer')
sha256sums=('013a9056b14469aa250080edd9894b5ed71f478b04eaef85fc92bee91bd8eac7')

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
}
