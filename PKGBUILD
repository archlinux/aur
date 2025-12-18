# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("x86_64" "aarch64")
url="https://github.com/agejevasv/goradion"
pkgver="v0.7.0"
pkgrel=1
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('93b4cd3840e3f41a627f7151a09ce907bb2d131302563fd3b7f0531798a07427595224be1d77cc0c65d177c84e5f3a45ccffe11eab0e81111ac91c9e1bab55f6')

build() {
  cd "${pkgname}-${pkgver#v}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname}" .
}

check() {
  cd "${pkgname}-${pkgver#v}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver#v}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
