# Maintainer: bhyoo <isac@runbear.io>

_name=graspologic-native
pkgname=python-graspologic-native
pkgver=1.2.5
pkgrel=1
pkgdesc="Python native companion module to the graspologic library"
arch=('x86_64' 'aarch64')
url="https://github.com/graspologic-org/graspologic-native"
license=('MIT')
depends=(
    'glibc'
    'libgcc'
    'python'
)
makedepends=(
    'maturin'
    'python-installer'
    'rust'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('27ea7e01fa44466c0b4cdd678d4561e5d3dc0cb400015683b7ae1386031257a0')

prepare() {
    cd "${_name//-/_}-${pkgver}"
    sed -i 's/requires-python = ">=3.8,<3.14"/requires-python = ">=3.8"/' pyproject.toml
}

build() {
    cd "${_name//-/_}-${pkgver}"
    maturin build --release --strip
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" target/wheels/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 NOTICE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
