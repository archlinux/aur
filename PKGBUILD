# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=pytr
pkgname="python-$_name-git"
pkgver=0.4.2.r1.g9b49e3f
pkgrel=1
pkgdesc='This is a library for the private API of the Trade Republic online brokerage.'
arch=('any')
url="https://github.com/pytr-org/pytr"
makedepends=('python-hatchling' 'python-hatch-babel')
license=('MIT')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-shtab' 'python-babel' 'python-websockets' 'python-requests-futures' 'python-pygments' 'python-pathvalidate'
  'python-packaging' 'python-ecdsa' 'python-coloredlogs' 'python-certifi'
  )
source=("${_name}::git+${url}.git")
sha256sums=(SKIP)

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
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}"
    version=$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])')
	python -m installer --destdir="${pkgdir}" "dist/${_name}-${version}-py3-none-any.whl"
}
