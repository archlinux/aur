# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=2.0.0
pkgrel=1
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=("BSD-3-Clause")
depends=('python'
         'python-black'
         'python-darkgraylib'
         'python-graylint'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-kwparametrize'
              'git'
              'python-regex'
              'python-pathspec'
              'python-pygments'
              'python-toml'
              'python-flynt'
              'python-isort')
optdepends=('python-isort: for sorting import statements'
            'python-pygments: terminal syntax highlighting'
            'python-flynt: convert string literals to f-strings')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        # TODO: should become unnecessary (PR has been merged) in next (2.0.1?) version
        "flynt-0-78-compatibility.patch::${url}/pull/480.patch")
sha512sums=('95abfe626323120f44e4607732218e82afe240388cdcc3ea3a3140046e40c06124fa06a70c77a2f9a062c3bdaa0c7e1514bee391fd874f56f05e38b420acf65f'
            'b01be276a286fb0f6a543ed34a85d1b4f899b4b7a46d02a3c953287c3536e3f76ee0a199e5a3e9677b17add9f06425a76a2f4559c429abbeed37abd0231c38b8')

prepare() {
  cd "darker-${pkgver}"
  patch -Np1 -i "${srcdir}/flynt-0-78-compatibility.patch"
  # tests mistakenly included because tests dir contains __init__.py file
  echo "prune src/darker/tests" >> MANIFEST.in
}

build() {
  cd "darker-${pkgver}"
  python -m build --no-isolation
}

check() {
  cd "darker-${pkgver}"
  # override XDG_CONFIG_HOME to avoid global black config breaking tests
  XDG_CONFIG_HOME="${pkgdir}" PYTHONPATH="${PYTHONPATH:+${PYTHONPATH}:}${PWD}/src" python -m pytest src
}

package() {
  cd "darker-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
