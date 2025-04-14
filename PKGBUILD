# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>

_reponame="lk-jwt-service"
pkgname="element-${_reponame}"
pkgver=0.2.3
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
	'dbe6f35ab44dcf5503ac5a331f3c2a2356accc91e7cbba9932472d9589dea0db5a95ac8d5d0a121d0d1c7809f437b7a75d9f4972a023018292eb2c5b998a37dc'
	'56073e7ce8f0fc6d991d4906e5ae2b279320e8bc2c345a4817f5fc87f432f7005b1b3f9949134e579c97917e4ca7e79ed22b4cc5c5aabd68995d480fb162f1fc'
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
