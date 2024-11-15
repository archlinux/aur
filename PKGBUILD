# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname='python-pytest-freezegun'
_pkgbase="${pkgname//python-/}"
pkgver=0.4.2
pkgrel=8
pkgdesc="Easily freeze time in pytest test + fixtures"
arch=('any')
license=('MIT')
url="https://github.com/ktosiek/pytest-freezegun"
depends=(
  'python-freezegun'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2bea7746e4e6a7f2a979cbc5c6d7a2576e0e2631a4e1d5abb7f27f76d6c32b0520a277474c092c5e05ce257f2ba19091918f67e28b7a2da1d5829037c6b70c55')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/${site_packages}" pytest
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
