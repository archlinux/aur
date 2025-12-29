# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-json-logic
_gitpkgname=json-logic-py
pkgver=0.6.3

# The upstream maintainer doesn’t create GitHub releases nor
# Git tags for their PyPI releases.
#
# We consider the Git commit from the day of the PyPI release
# a reasonable approximation for the actual release.
_commit=56d8e566755ea059a40b396fde0af5d65b7a0af5

pkgrel=1
pkgdesc='Build complex rules, serialize them as JSON, and execute them in Python'
arch=('any')
url='https://github.com/nadirizr/json-logic-py'
license=('MIT')
depends=(
  'python'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/nadirizr/json-logic-py/archive/${_commit}.tar.gz"
  'github-pr-1.patch'
)

sha512sums=(
  '942fabe5bc4582beb363e777bb3fe955994e5d5c9d8b3aa0eaba64b71116ca415fbb62136fa39539e490d49b1483ff71ba4b7adc85884c45ad66593869e83e61'
  'f1b49428e56b8ac06fd6e32012691577ce6e81b4f43c048bdbf95c4c9e93e35bedbcb1d7d7afc43cabdcda908674fa33d35c5f18d0ac85386ecc3a56174cc484'
)

prepare() {
  cd "${_gitpkgname}-${_commit}"

  # Remove this patch once the upstream author has included PR #1
  # in a stable release. (Not going to hold my breath though because
  # the PR is 10 years old.)
  # See also: https://github.com/nadirizr/json-logic-py/pull/1
  echo >&2 'Applying patch to add Python 3 compatibility'
  patch -p1 < ../github-pr-1.patch
}

build() {
  cd "${_gitpkgname}-${_commit}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${_commit}"

  echo >&2 'Testing the library'
  python \
    -c 'from json_logic import jsonLogic; print(jsonLogic({ "==": [1, 1] }))' \
    > actual.txt
  if ! grep -qF "True" actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}-${_commit}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md README.rst

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
