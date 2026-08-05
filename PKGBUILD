# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=badger
pkgver=4.9.6
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://dgraph-io.github.io/badger'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
replaces=('badgerdb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
b2sums=('523768f4dc49cdd15707b9791dfb1a2e20172b2c34f7bf3546cf1d7708410a0f0db1141bf39807dc904c5ad741c7817784735bf241717e03a836d3267faf7015')

prepare() {
  cd "${pkgname}-${pkgver}/badger"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}/badger"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  cd badger/build
  install -Dm755 badger -t "$pkgdir/usr/bin/"
#  install -Dm644 <(./badger completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/badger"
#  install -Dm644 <(./badger completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/badger.fish"
#  install -Dm644 <(./badger completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_badger"
}
