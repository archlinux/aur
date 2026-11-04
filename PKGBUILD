# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pymboot-rs
_name=${pkgname#python-}
pkgver=0.3.0
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
sha256sums=('09b11bf8c93c83e7bcff398c39b900b631603c2d69ff14efcf2158a36a5f9d54')

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
