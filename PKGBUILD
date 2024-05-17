# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=python-pygithub
pkgname="$_name-git"
pkgver=v2.3.0.r1.g60136105
pkgrel=1
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
provides=('python-pygithub')
conflicts=('python-pygithub')
depends=('python-deprecated' 'python-pyjwt' 'python-requests' 'python-pynacl')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized')
source=("${_name}::git+${url}.git")
sha512sums=(SKIP)

pkgver() {
  cd "${_name}"
  _version=$(python3 -m setuptools_scm 2>&-)
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    exit 1
    #printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  python -m pytest
}

package() {
  cd "$_name"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
