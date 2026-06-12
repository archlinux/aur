# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=badger
pkgver=4.9.2
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://dgraph-io.github.io/badger'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
replaces=('badgerdb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
sha256sums=('c1dfe49b305dcb7a744ed292df07467f25cb89062de99c91b5840e3d38abd56e')

prepare() {
  cd "${pkgname}-${pkgver}/badger"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}/badger"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${pkgname}-${pkgver}/badger"
  install -Dm755 build/badger "${pkgdir}/usr/bin/badger"
  install -Dm644 <(./badger completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/badger"
  install -Dm644 <(./badger completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/badger.fish"
  install -Dm644 <(./badger completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_badger"
}
