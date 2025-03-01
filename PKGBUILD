# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_gitname=lk-jwt-service
pkgname="element-${_gitname}-git"
pkgver=r89.4556455
pkgrel=1
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64)
url='https://github.com/vector-im/lk-jwt-service/'
license=("AGPL-3")
makedepends=(go git)
source=(
  "git+https://github.com/vector-im/lk-jwt-service.git"
  "${_gitname}.service"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_gitname
}

build() {
  cd $_gitname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o lk-jwt-service
}

package() {
  install -vDm755 $_gitname/lk-jwt-service -t "$pkgdir/usr/bin"
  install -vDm644 $_gitname.service -t "$pkgdir/usr/lib/systemd/system/"
}
