# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>

_reponame="lk-jwt-service"
pkgname="element-${_reponame}"
pkgver=0.1.1
pkgrel=2
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64)
url='https://github.com/vector-im/lk-jwt-service/'
license=("AGPL-3")
makedepends=(go git)
source=(
	"https://github.com/element-hq/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz"
	"${_reponame}.service"
)
sha512sums=(
	'6c3597459429ee67b6403c3969186dccf4b2b718e8160151bd31355572ca7002b6bfd6aea4cd50157df555403241556247c62f88f0da384c69b02adba4301bb8'
	'92d7a9e3d80d18ceaf0ea65d31af4175d4b86d81bf3abeeb314416901c59f52e9e0a55f8a45b8a92b03a2ac129760a6e84971a5280950f10a5d569f19c40e8b5'
)

prepare() {
  cd ${_reponame}-${pkgver}
}

build() {
  cd ${_reponame}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o lk-jwt-service
}

package() {
  install -vDm755 ${_reponame}-${pkgver}/lk-jwt-service -t "$pkgdir/usr/bin"
  install -vDm644 ${_reponame}.service -t "$pkgdir/usr/lib/systemd/system/"
}
