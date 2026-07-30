# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-consolekit
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Additional utilities for click'
arch=(any)
url='https://consolekit.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-click
  python-colorama
  python-deprecation-alias
  python-domdf-python-tools
  python-mistletoe
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-flit-core
)
optdepends=(
  'python-psutil: better terminal support'
)
source=("$_name::git+https://github.com/domdfcoding/consolekit#tag=v$pkgver")
sha512sums=('cd13ef17e10034055706d2c0f86f42d797fd81f0fa1e390c74c047b1d582933e0329110ff3c3c1c5a357d78524a02ee2e82a28f18a3a1df16451cf296555c399')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's/"\([a-zA-Z0-9_.-]*\)[<>=!~][^"]*"/"\1"/g' pyproject.toml
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
