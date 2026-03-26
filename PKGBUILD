# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
pkgver=0.8.0
pkgrel=1
license=('Unlicense')
makedepends=('go')
depends=('mpv')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e9c6bb3f29283c99bc9afd40ca27973d7f16566654f799a28c14be500358808342619366cd0c3f0dd94835ba794aa5cbe3e3fa85ba112582ce67d4adc4bd827a')

prepare() {
  cd "${pkgname}-${pkgver}" || exit
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}" || exit

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -bindnow" \
    -o build/"${pkgname}" \
    .
}

check() {
  cd "${pkgname}-${pkgver}" || exit
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  install -Dm755 build/"$pkgname" "$pkgdir/usr/bin/$pkgname"
}
