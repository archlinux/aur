# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=mkcert-git
pkgver=1.4.4.r1.g1c1dc4e
pkgrel=1
pkgdesc="Simple tool for making locally-trusted development certificates"
arch=('x86_64')
url="https://github.com/FiloSottile/mkcert"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GO_LDFLAGS="-linkmode=external -X main.Version=v${pkgver%.r*}"
  go build -v -ldflags "$GO_LDFLAGS"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 -t "$pkgdir/usr/bin" mkcert
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
