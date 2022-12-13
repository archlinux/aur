# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=(python-specklepy-git)
pkgver=2.9.1.r10.g67499ab
pkgrel=1
pkgdesc="This is the start of the Python client for Speckle 2.0. It is currently quite nebulous and may be trashed and rebuilt at any moment! It is compatible with Python 3.6+."
arch=('x86_64' 'i686')
url="https://github.com/specklesystems/speckle-py"
license=('Apache')
depends=('python' 'python-pydantic' 'python-gql' 'python-aiohttp' 'python-appdirs' 'python-requests' 'python-websockets')
optdepends=()
makedepends=()
provides=('python-specklepy')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/specklesystems/speckle-py.git")
_python_ver=$(python --version | grep -Po 'Python \K[0-9].[0-9]+')

prepare() {
  cd "${srcdir}/speckle-py/src"
}

pkgver() {
  cd speckle-py

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd "${srcdir}/speckle-py/src"
}

package() {
  # Install license file
  cd "${srcdir}/speckle-py"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install python modules
  mkdir -p "${pkgdir}/usr/lib/python${_python_ver}/site-packages/"
  cd "${pkgdir}/usr/lib/python${_python_ver}/site-packages/"
  cp -rf "${srcdir}/speckle-py/src/specklepy" "./"
  python -O -m compileall "./"
}

md5sums=('SKIP')
