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
	"env.conf"
)
sha512sums=(
	'89dc981df1281f30fcea8f20c8eaf1d79f8968fa67362d4b1310e63225adf2fbcd23ef0ecc660f229614fbb738779c27207f416f8e8cfdcc5880cd9caca61b66'
	'48fdad2ad2eb41fbba132cf7a8f2abe9ade07cc0d4d9a80c9a8f9180d7810dd46c41b34d889b4194756cbea15bd8d1875aa611bac4ee0cf993dcbf9079f02290'
	'd5b97a3dfb67af84070a8075d67f3411955f7e227cd3e38c3f0f1f06fa1a7578f18907f9d44e09338cc10090e74a55dd8dc473a07976858fd1d66b1dbb39748a'
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
