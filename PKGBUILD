# Maintainer: Chris Lane <aur at chrislane dot com>

pkgname=mods
pkgver=1.3.1
pkgrel=1
pkgdesc="AI for the command line, built for pipelines"
url="https://github.com/charmbracelet/mods"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/charmbracelet/mods/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1de471cc4a0aff50720062d310786e81eb74eb3da3f87c1bda0210bb3f36abeb0498a8a2c0ebd71493bf597226d3c0dcc591778970346623dfdb2afe8d107844')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  # Flags from https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go mod download

  go build -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
