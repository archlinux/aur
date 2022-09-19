# Maintainer: JP-Ellis <josh@jpellis.me>
pkgname=erigon-git
_pkgname=${pkgname%-git}
pkgver=2022.09.02+11
pkgrel=1
pkgdesc="Ethereum execution layer implementation in Go"
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
depends=('glibc')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="erigon-git.install"
source=("git+https://github.com/ledgerwatch/erigon.git#branch=devel"
        "ethereum-tests::git+https://github.com/ethereum/tests"
        "erigon-git.install")
sha256sums=('SKIP'
            'SKIP'
            'f9950a2111c57bac7be081768c2e58594df9d438b35cdc35ec0a54de81b82ff7')

pkgver() {
  cd "${_pkgname}"
  # For some reason, the standard way of getting the latest tag doesn't work
  tag=$(git describe --tags $(git rev-list --tags --max-count=1))
  commits=$(git rev-list --count "$tag"..)
  echo "${tag#v}+${commits}" | sed 's/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule."tests".url "${srcdir}/ethereum-tests"
}

build() {
  cd "${_pkgname}"

  export CGO_LDFLAGS="$LDFLAGS"
  make all
}

package() {
    cd ${_pkgname}

    for binary in build/bin/*; do
      filename=${binary##*/}
      if [[ "${filename}" = "erigon" ]]; then
        install -Dm755 "${binary}" "${pkgdir}/usr/bin/${filename}"
      else
        install -Dm755 "${binary}" "${pkgdir}/usr/bin/erigon-${filename}"
      fi
    done
}

# vim:set ts=2 sw=2 et:
