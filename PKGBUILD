# Maintainer: Chris Lane <aur at chrislane dot com>

pkgname=mods
pkgver=1.5.0
pkgrel=1
pkgdesc="AI for the command line, built for pipelines"
url="https://github.com/charmbracelet/mods"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/charmbracelet/mods/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7de712cdc0dce4394820f3c3b855cfa11adda4161f5d1907c4a3ee1bb763d5c8dd445fa7ac83340bfe38735478ad7c3b5ea38bf1f35bdcdf63ed7693491e97a7')

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

  "build/$pkgname" man | gzip > "build/$pkgname.1.gz"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "build/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
