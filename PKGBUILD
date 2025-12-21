# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>

_reponame="lk-jwt-service"
pkgname="element-${_reponame}"
pkgver=0.4.0
pkgrel=1
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64)
url='https://github.com/vector-im/lk-jwt-service/'
license=("AGPL-3")
makedepends=(go git)
source=(
	"https://github.com/element-hq/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz"
	"${_reponame}.service"
	"env.conf"
)
sha512sums=(
	'55f368c0cdb5dab0583f42db421c41d9884902bbcd6aff11d642fd083d7aa5e3338479f782eb87dd4e6d26beb5105ba2a084893a21d16d215f01a19a1fa7a781'
	'48fdad2ad2eb41fbba132cf7a8f2abe9ade07cc0d4d9a80c9a8f9180d7810dd46c41b34d889b4194756cbea15bd8d1875aa611bac4ee0cf993dcbf9079f02290'
	'5d1a093b2764cbab722652f552c229c3269b360d6d0252242280582322d8bf5b78954b57d27009a7da7afa9268377545ff8560579de54296a35c40b226bbc517'
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
  install -vDm644 env.conf -t "$pkgdir/etc/lk-jwt-service/"
}
