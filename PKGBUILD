pkgname=go-symbols-git
pkgver=r3.b75dfef
pkgrel=1
epoch=1
pkgdesc="A utility for extracting a JSON representation of the package symbols from a go source tree."
arch=('i686' 'x86_64')
url="https://github.com/newhook/go-symbols"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  go mod init "${url#https://}"
  go mod tidy
}

build() {
  cd ${pkgname%-git}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/
}

package() {
  cd ${pkgname%-git}
  install -Dm755 -t "$pkgdir/usr/bin" build/go-symbols
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
