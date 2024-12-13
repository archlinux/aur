# Maintainer: surrogatesoul <surrogatesoul@proton.me>

pkgname=bookbrowse
pkgver=0.1.0
pkgrel=1
pkgdesc="Search books within your terminal"
arch=('x86_64')
url="https://github.com/hatredholder/bookbrowse"
license=('GPL3')
makedepends=('git' 'go')
depends=('glibc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

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

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
