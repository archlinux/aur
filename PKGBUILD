# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname='python-pytest-freezegun'
_pkgbase="${pkgname//python-/}"
pkgver=0.3.0.post1
pkgrel=1
pkgdesc="Easily freeze time in pytest test + fixtures"
arch=('any')
license=('MIT')
url="https://github.com/ktosiek/pytest-freezegun"
depends=('python-black' 'python-pytest' 'python-freezegun')
makedepends=('python-setuptools-scm')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('1e7a935c02680cc536f46ec6912746d2396d93b51bed9db00472560d1d6c1034a849d495f7cc88895a1ff1eb8d7149266cfad6599e030c6dea8ffcf11b680c80')

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
