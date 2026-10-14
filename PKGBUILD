# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pymboot-rs
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Python bindings for McuBoot implementation in Rust, providing high-performance communication with NXP MCU bootloader"
provides=(${pkgname} rblhost)
conflicts=(${pkgname} rblhost)
arch=($CARCH)
url="https://github.com/nxp-mcuxpresso/rblhost"
# _pydeps=(
# )
depends=(
    libgcc
    systemd-libs
    python
    # "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-rust'
    'python-wheel'
)
optdepends=()
options=(!debug !lto)
license=('BSD-3-Clause')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('4003ecddc991652a454381a559e982858b6c61c5608abef69c499798161dbc10')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
