# Maintainer: taotieren <admin@taotieren.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=python-deepmerge
_name=${pkgname#python-}
pkgver=4.0.1
pkgrel=3
pkgdesc="A deep merging tool for Python core data structures"
arch=(any)
url="https://github.com/toumorokoshi/deepmerge"
license=(MIT)
depends=(
  python
  python-pytest
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=()
options=('!strip' '!debug')
source=($_name::git+$url.git#tag=v$pkgver)
sha512sums=('a04b7be16bf418f955c4684a38568fdfdcbf376f42a3b1b028ad97f106b2e16f66902b47598326639f613b1c50d59d8b840b96d3589f3975e2f873a4d8efc159')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "${srcdir}/${_name}"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${srcdir}/${_name}"
  pytest -v
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
