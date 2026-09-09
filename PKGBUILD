# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-arm-gdb
_name=${pkgname#python-}
pkgver=0.9.10
pkgrel=6
epoch=
pkgdesc="Python module for GDB to analyze ARM core registers"
arch=('any')
url="https://github.com/pengi/arm_gdb"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-cmsis-svd
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools-git-versioning
)
checkdepends=()
source=("${_name}::git+${url}.git#tag=${pkgver}")
sha256sums=('d905f6e01a5d5418f23d7ec76171f4cc04a4011947bc054e46308fb52962c1ca')

prepare(){
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i -E '/setuptools-git-versioning/s/<[0-9][^"]*//' pyproject.toml
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
