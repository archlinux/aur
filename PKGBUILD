# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=python-pygithub
pkgname="$_name-git"
pkgver=v2.1.1.r3.gdc37d5c1
pkgrel=2
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
  _version=$(python setup.py -V 2>&-)
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name"
  python setup.py build
}

check() {
  cd "$_name"
  python -m pytest
}

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir" --optimize=1
}

