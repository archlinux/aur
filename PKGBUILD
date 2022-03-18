pkgname=go-pkgs-git
pkgver=r14.81e90e2
pkgrel=1
epoch=1
pkgdesc="Command gopkgs list your installed Go packages for import"
arch=('i686' 'x86_64')
url="https://github.com/tpng/gopkgs"
license=('MIT')
makedepends=('go' 'git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd gopkgs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gopkgs
  go mod init "${url#https://}"
  go mod tidy
}

build() {
  cd gopkgs
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd gopkgs
  install -Dm755 -t "$pkgdir/usr/bin" gopkgs
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
