# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=walgot
pkgver=0.2.0
_pkgver=v$pkgver
pkgrel=1
pkgdesc='A wallabag TUI client'
arch=('x86_64')
url="https://git.sr.ht/~bacardi55/$pkgname"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver::$url/archive/$_pkgver.tar.gz")
sha256sums=('c24a6cf56145a7d4742d310bfe53e7ae137e1ad78301a90a17b40ca3adcac81a')

prepare(){
  cd "$pkgname-$_pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$_pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "$pkgname-$_pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 docs/keybinds.md "$pkgdir"/usr/share/doc/$pkgname/keybinds.md
  install -Dm644 example/credentials.json "$pkgdir"/usr/share/doc/$pkgname/example/credentials.json
  install -Dm644 example/walgot.json "$pkgdir"/usr/share/doc/$pkgname/example/walgot.json
}
