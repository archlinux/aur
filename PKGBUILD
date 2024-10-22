# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=pytr
pkgname="python-$_name-git"
pkgver=0.3.0.r0.g3280e88
pkgrel=1
pkgdesc='This is a library for the private API of the Trade Republic online brokerage.'
arch=('any')
url="https://github.com/pytr-org/pytr"
makedepends=('python-setuptools')
license=('MIT')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-shtab' 'python-babel' 'python-websockets' 'python-requests-futures' 'python-pygments' 'python-pathvalidate'
  'python-packaging' 'python-ecdsa' 'python-coloredlogs' 'python-certifi'
  )
source=("${_name}::git+${url}.git")
sha512sums=(SKIP)

pkgver() {
  cd "${_name}"
  _version=$(python3 -m setuptools_scm 2>&-)
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
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
