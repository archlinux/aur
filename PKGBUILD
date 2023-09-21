# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_pkgname=cpu
pkgname=$_pkgname-git
pkgver=20230915
pkgrel=1
pkgdesc='cpu command in Go, inspired by the Plan 9 cpu command'
arch=('any')
license=('BSD')
makedepends=(git go)
url='https://github.com/u-root/cpu'
source=("git+$url#commit=c34f1ddc32533aaaebf829584d915a2e98f9ba39")
b2sums=('SKIP')

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd $_pkgname
  install -Dm755 build/cpu  "$pkgdir"/usr/bin/cpu
  install -Dm755 build/cpud "$pkgdir"/usr/bin/cpud
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
