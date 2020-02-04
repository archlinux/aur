# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname='python-pytest-freezegun'
_pkgbase="${pkgname//python-/}"
pkgver=0.4.1
pkgrel=1
pkgdesc="Easily freeze time in pytest test + fixtures"
arch=('any')
license=('MIT')
url="https://github.com/ktosiek/pytest-freezegun"
depends=('python-black' 'python-pytest' 'python-freezegun')
makedepends=('python-setuptools-scm')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('42cebf13538e9a8aa992555e086886210dfb40b95fd8a4bb8bb79c5968e08aafa1979ff3cb28425993b71f5df91d77012946e36f14ad512a9d3d856eddb5fe3e')

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
