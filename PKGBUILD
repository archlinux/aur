# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname='python-pytest-freezegun'
_pkgbase="${pkgname//python-/}"
pkgver=0.4.2
pkgrel=1
pkgdesc="Easily freeze time in pytest test + fixtures"
arch=('any')
license=('MIT')
url="https://github.com/ktosiek/pytest-freezegun"
depends=('python-black' 'python-pytest' 'python-freezegun')
makedepends=('python-setuptools-scm')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2bea7746e4e6a7f2a979cbc5c6d7a2576e0e2631a4e1d5abb7f27f76d6c32b0520a277474c092c5e05ce257f2ba19091918f67e28b7a2da1d5829037c6b70c55')

# setuptools won't find version from git tag
export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  # lookup path, i.e. "/usr/lib/python3.8"
  local python_stdlib_basepath="$(python -c "from sysconfig import get_path; print(get_path('stdlib'))")"
  # Hack entry points by installing it
  python setup.py install --root="${PWD}/tmp_install" --optimize=1
  export PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}:${PWD}/tests"
  py.test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
