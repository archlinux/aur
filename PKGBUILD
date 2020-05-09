# Maintainer: Bryan Burke <bryan.t.burke@gmail.com>
pkgname=keys-pub-git
pkgver=v0.0.43.r0.g22cc591
pkgrel=1
pkgdesc='keys.pub CLI - keys and keysd'
arch=('x86_64')
url="https://github.com/keys-pub/keysd"
license=('MIT')
makedepends=('go' 'libfido2')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  (
    set -o pipefail
    cd "${pkgname}"
    git checkout $(git describe --long --tags)
    commit=$(git rev-parse --short HEAD)
    date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    cd service
    mkdir -p bin

    go build -o bin/keysd -ldflags "-X main.version=$pkgver -X main.commit=$commit -X main.date=$date" ./keysd/main.go
    go build -o bin/keys -ldflags "-X main.version=$pkgver -X main.commit=$commit -X main.date=$date" ./keys/main.go
    go build -o bin/fido2.so --buildmode=plugin -ldflags "-X main.version=$pkgver -X main.commit=$commit -X main.date=$date" ./fido2/plugin.go
  )
}

package() {
  cd "${pkgname}/service/bin"
  install -Dm755 keys "$pkgdir"/usr/bin/keys
  install -Dm755 keysd "$pkgdir"/usr/bin/keysd
  install -Dm644 fido2.so "$pkgdir"/usr/bin/fido2.so
}
