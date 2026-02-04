# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-domdf-python-tools
_name=${pkgname#python-}
pkgver=3.10.0
pkgrel=2
pkgdesc='Helpful functions for Python'
arch=(any)
url='https://domdf-python-tools.readthedocs.io'
license=(MIT)
depends=(
  python
  python-natsort
  python-typing_extensions
  python-pandas
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-hatchling
  python-hatch-requirements-txt
)
source=("$_name::git+https://github.com/domdfcoding/domdf_python_tools#tag=v$pkgver")
sha512sums=('ddcba2085564e58cd9d81a5e116e78fdc970b9d5828d5a31280caf437619a21382895b319309c4ce278fd8d91aa903a9fce6cbcfa06593e3b4035e63015165b1')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
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
