# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>

_reponame="lk-jwt-service"
pkgname="element-${_reponame}"
pkgver=0.3.0
pkgrel=1
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
	'89dc981df1281f30fcea8f20c8eaf1d79f8968fa67362d4b1310e63225adf2fbcd23ef0ecc660f229614fbb738779c27207f416f8e8cfdcc5880cd9caca61b66'
	'6abbd585f2f0fe47dfd01cc8f139407a0b36877375001decaf0b96e57fd6834514f0317b9d79c7fcea74ee911db0afd1f25384d481baabc092c6e65881d9f36d'
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
