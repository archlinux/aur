# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=poetry-plugin-export
pkgname=python-poetry-plugin-export-git
pkgver=1.6.0.r3.ga2399dc
pkgrel=3
pkgdesc="Poetry plugin to export the dependencies to various formats -- git version"
url="https://github.com/python-poetry/poetry-plugin-export"
license=('MIT')
arch=('any')
depends=('python-poetry')
makedepends=('python-build' 'python-installer')
checkdepends=('python-pytest-mock' 'python-pytest-xdist')
provides=('python-poetry-plugin-export')
conflicts=('python-poetry-plugin-export')
source=("git+https://github.com/python-poetry/poetry-plugin-export.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${_pkgname}"
  python -m build -wn
}

check() {
  cd "${_pkgname}"
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "${_pkgname}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
