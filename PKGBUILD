# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors
_reponame=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_reponame"
pkgver=v0.1.3
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "lm_sensors")
conflicts=("watt-wiser-git" "watt-wiser-sensors-git")

source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('5f9377878c235513345a6aff4618715933157a06b22c513b5e807852674cab7814634f5697ef91f3d47ad723290dd78253a5a81c7dfcc23d7b15075078c301f0')

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
