# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=humble-cli
pkgver=0.23.0
pkgrel=1
pkgdesc='The missing CLI for downloading your Humble Bundle purchases '
arch=('x86_64')
url="https://github.com/smbl64/humble-cli"
license=('MIT')
makedepends=(
    go
    git
)
source=("git+$url#tag=v$pkgver")
b2sums=('f559bbe1f336d56b9921a1c966cbca7feebb9be3109f577ff6b293dd2b8e30634d7cf59c1ff80d08b029bc677ac094fe22b1a2cedf0f54b62342617c4cf69656')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-s -w" -o build ./cmd/...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
