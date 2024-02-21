# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors
_reponame=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_reponame"
pkgver=v0.0.6
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "lm_sensors")
provides=($pkgname)
conflicts=("$pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0e42868d98bc92b8730fa14f7059f0dc8d2d49512ba32d6cdaf889a31ea58bb9')
sha512sums=('efb959e0ae8894809027332fec2ef1e9d0044cd1c1d7de27fa2d31dd42fa69b0c8ace3cb7400ba122c9d284484729664540c50f5ee640c672b12839308847abf')
b2sums=('a8b9e3b0d906b0ada42eb3ba47eef0302798c5bb53405ffe9c8eca8b705acf7ed4549eec5aa5bbaa4d44e686b8ff2d257185c4716680efc683823dcc347f3a74')

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
