# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors
_reponame=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_reponame"
pkgver=v0.0.7
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "lm_sensors")
provides=($pkgname)
conflicts=("$pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1166245f0da7171e7670e4b30d5572a32e20e12c78cd329fb099f007ee95ccf2')
sha512sums=('a70e8ebbba7197b88b36887a0a58cbbf978031f972ce5e0a786039e21077d3626dce6e51eb51bc9600c48bf94437a15203fe35d847159c576296633de6083831')
b2sums=('8a2b703c0d1b674e6ebf126894b02f7de2f7ef79e7fcc0fcc44f4ec11a523aa94ac150474314c48fdb8c01af9b52a42407a59c37009847e48f9171aa2b6df22f')

build() {
  cd "${_reponame}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname}" ./cmd/watt-wiser-sensors
}

check() {
  cd "${_reponame}-${pkgver}"
  go test ./...
}

package() {
  cd "${_reponame}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"
}
