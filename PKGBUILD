# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors
_reponame=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_reponame"
pkgver=v0.1.2
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "lm_sensors")
conflicts=("watt-wiser-git" "watt-wiser-sensors-git")

source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('164df3f67f2a1101f6cfce29d13bd11e3c5fd53e2fc718d6b5e57cb7edf8d2a273f44325c6f1f04725f8aee5471ac624e86f0b03fa8ccf4b33c4c0547dc77ed6')

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
