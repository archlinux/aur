# Maintainer: Chris Lane <aur at chrislane dot com>

pkgname=mods
pkgver=1.2.1
pkgrel=1
pkgdesc="AI for the command line, built for pipelines"
url="https://github.com/charmbracelet/mods"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/charmbracelet/mods/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4cd4f1a795a63da79e2d89f4f4c0725b0d839a019e24139dedf55d068a15a8c8c9c6b01af6cb579259fd81456f3f50cc77e4d2b6ad9563465790f0c13d29d77a')

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
