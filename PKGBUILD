# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=age-git
pkgver=1.0.0.beta2.r35.gc9a35c0
pkgrel=1
pkgdesc="A simple, modern and secure file encryption tool"
url="https://github.com/FiloSottile/age"
license=('BSD')
provides=('age')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

prepare(){
  cd "${pkgname%-git}"
  mkdir -p build/
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname%-git}/build/age" "$pkgdir/usr/bin/age"
  install -Dm755 "${pkgname%-git}/build/age-keygen" "$pkgdir/usr/bin/age-keygen"
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
