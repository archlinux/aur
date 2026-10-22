# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-domdf-python-tools
_name=${pkgname#python-}
pkgver=3.11.0
pkgrel=1
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
sha512sums=('c540a3dfd18297f74896d152bce737848bc99f1606884746fa864d8409dcf26783577563f5583c4ede5290e3e89a644f45de3800f100c0b62791e99125fabd7b')

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
