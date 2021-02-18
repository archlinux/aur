pkgname=aws-auth-git
pkgver=v0.0.0.r16.g93e4593
pkgrel=1
pkgdesc='Manage AWS credential for a range of workflows'
arch=('x86_64')
url="https://github.com/joshdk/aws-auth"
license=('MIT')
makedepends=('go')
source=('git+https://github.com/joshdk/aws-auth')
sha256sums=('SKIP')

pkgver() {
  cd "aws-auth"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "aws-auth"
  mkdir -p build/
}

build() {
  cd "aws-auth"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "aws-auth"
  go test ./...
}

package() {
  cd "aws-auth"
  install -Dm755 build/aws-auth "$pkgdir"/usr/bin/aws-auth
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
