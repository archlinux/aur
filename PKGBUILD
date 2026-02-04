# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dist-meta
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=2
pkgdesc='Parse and create Python distribution metadata'
arch=(any)
url='https://dist-meta.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-domdf-python-tools
  python-handy-archives
  python-packaging
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
#checkdepends=('')
#optdepends=('')
source=("${_name}::git+https://github.com/repo-helper/dist-meta.git#tag=v$pkgver")
sha512sums=('d5c780be311d0e19d144b8fa207250caf369720e85829f2c1bbd263ecaecad4c302d3c03aef1ea2ca619a97d68b22e045b93428bd8aeea0819420f5b66ada5db')

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
