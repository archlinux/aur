# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
pkgver=0.10.0
pkgrel=1
license=('Unlicense')
makedepends=('go')
depends=('mpv')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('67741a7c48e36536737320661be10446e27856484c70c3a7ac7d6a30d45dd68e34e685ba9e8558f65c06b176a9b4a6487d26f619c2657da747ca20483ddd4da9')

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
