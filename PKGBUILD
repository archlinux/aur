# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=badger
pkgver=4.9.5
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://dgraph-io.github.io/badger'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
replaces=('badgerdb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
b2sums=('4a1ef147aeaf494de5cbdfdd59d64540982640eff207e8525cf3acd1b0355374cf7f0e49eef488b153a4cc6010137f7284b7981f3b6a665a5ca2de9908b725d2')

prepare() {
  cd "${pkgname}-${pkgver}/badger"
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
