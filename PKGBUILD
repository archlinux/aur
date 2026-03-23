# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
pkgver=0.7.2
pkgrel=1
license=('Unlicense')
makedepends=('go')
depends=('mpv')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('619121cbada75634619eea8d673aeb1a81476bbbf4cda3bfd9014808aa89c0f6b73d42499f3e6c5f886234c6b0527ac37a6a0312310e135fd7994feb3a435378')

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
