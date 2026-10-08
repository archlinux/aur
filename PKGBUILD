# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-json-logic-git
_gitpkgname=json-logic-py
pkgver=0.7.0.alpha.r22.5fda912
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("python-json-logic=${pkgver}")
conflicts=('python-json-logic')

source=("${_gitpkgname}::git+https://github.com/nadirizr/json-logic-py.git")
sha512sums=('SKIP')

pkgver() {
  printf "%s.r%s.%s" \
    "$(
      awk -F \' '/version=/ { print $2 }' "${_gitpkgname}/setup.py" \
      | tr - .
    )" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}"

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
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md README.rst

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
