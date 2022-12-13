pkgname=ecoji
pkgver=2.0.1+5+g805d064
pkgrel=1
pkgdesc="Encode or decode data as Unicode emojis."
arch=("x86_64")
url="https://github.com/keith-turner/ecoji"
license=("APACHE")
makedepends=(git go)
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  mkdir -p build/
  git describe --tags | sed "s/^v//;s/-/+/g"
}

build() {
  cd "$pkgname"/cmd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../build ./ecoji.go
}


package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
