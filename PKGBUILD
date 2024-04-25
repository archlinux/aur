# Maintainer: gilcu3 <gilcu3 [at] gmail [dot] com>

_pkgname=addr-book-combine
pkgname=$_pkgname-git
pkgver=r9.11696f4
pkgrel=1
pkgdesc='Combine multiple aerc-style address books into a single address book, with de-duplication and smart sorting.'
arch=('any')
url="https://git.sr.ht/~jcc/addr-book-combine"
license=('GPL3')
makedepends=('go')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  if [[ -n "$TAG" ]]
  then
    printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
  else
    printf "r%s.%s" "$REVISION" "$COMMIT"
  fi
}

prepare(){
    cd "$_pkgname"
    mkdir -p build
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode external" -o build/$_pkgname
}


package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
