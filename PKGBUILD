# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=python-pygithub
pkgname="$_name-git"
pkgver=v2.8.0.r27.g61dcf49d
pkgrel=2
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
provides=('python-pygithub')
conflicts=('python-pygithub')
depends=('python-pynacl' 'python-requests' 'python-pyjwt' 'python-typing_extensions' 'python-urllib3')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized' 'python-responses')
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
  rm -rf 'dist' 'build' '.eggs' '.cache' # clean up previous builds
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
