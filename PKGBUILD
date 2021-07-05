# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile
_binname=gtask
pkgver=3.5.0
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go. Installs as gtask to allow coexistance with taskwarrior."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://taskfile.dev/"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}::git://github.com/go-task/task#tag=v${pkgver}")
md5sums=('SKIP')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${_binname} ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/${_binname} "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
