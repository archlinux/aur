# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-nixnet
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Communicate over CAN or LIN via NI-XNET hardware with Python"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/ni/nixnet-python"
_pydeps=(
    six
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-poetry-core'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('7a5c95252d125ae09b2a14ef6fe285c4ec3fcabdf5b97a482cb57cbf002574ea')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
