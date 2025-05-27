# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=erigon-git
_pkgname=${pkgname%-git}
pkgver=3.0.4.r0.406d855
pkgrel=4
pkgdesc="Ethereum execution layer implementation in Go"
arch=('x86_64')
url="https://github.com/erigontech/erigon"
license=('GPL3')
depends=('glibc')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')  # Optional: keep debugging symbols
source=("git+https://github.com/erigontech/erigon.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local tag count hash

  tag=$(git tag | grep -E '^v[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}$' | sort -V | tail -n1)
  count=$(git rev-list --count "${tag}"..HEAD)
  hash=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.%s" "${tag#v}" "$count" "$hash"
}

prepare() {
  cd "${_pkgname}"
  git fetch --tags

  local tag
  tag=$(git tag | grep -E '^v[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}$' | sort -V | tail -n1)
  git checkout "$tag"

  git submodule update --init --depth 1
}

build() {
  cd "${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOTMPDIR="${srcdir}/.gotmp"
  mkdir -p "$GOTMPDIR"
  make all
}

package() {
  cd "${_pkgname}/build/bin"
  for bin in *; do
    if [[ "$bin" == "erigon" ]]; then
      install -Dm755 "$bin" "${pkgdir}/usr/bin/$bin"
    else
      install -Dm755 "$bin" "${pkgdir}/usr/bin/erigon-$bin"
    fi
  done
}
