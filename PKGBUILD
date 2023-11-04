# Maintainer: YeZheng <csyezheng@gmail.com>

pkgname=a2fa
pkgver=0.16.2
pkgrel=1
pkgdesc="a2fa (annoying two-factor authentication) is a command line tool for generating and validating one-time password."
arch=('x86_64')
url="https://github.com/csyezheng/a2fa"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0E9C5891854EF1C46B0CC452285325ABBBB227A04E8A2869EA931CD819522789')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/a2fa ./cmd/
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}