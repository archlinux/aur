# Maintainer: surrogatesoul <surrogatesoul@proton.me>

pkgname=bookbrowse
pkgver=0.0.1
pkgrel=1
pkgdesc="Search books within your terminal "
arch=('x86_64')
url="https://github.com/hatredholder/bookbrowse"
license=('GPL3')
makedepends=('git' 'go')
depends=('glibc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"

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

package() {
  cd "$pkgname"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "build/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

