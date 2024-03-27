# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors
_reponame=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_reponame"
pkgver=v0.1.0
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "lm_sensors")
conflicts=("watt-wiser-git" "watt-wiser-sensors-git")

source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('be106ed2808ee442577a83cc446b1ea7abe1f05385cad58ead9d7108ee3b0988822b57ada29b1ad6bda81fcab0cf65cba0baf45bd9dc7a55b8fe8b66a48b2d05')

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
