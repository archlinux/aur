# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task
_pkgname=task
pkgver=3.12.1
pkgrel=2
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=('any')
url="https://github.com/go-task/task"
license=('MIT')
replaces=('gotask-taskfile')
conflicts=('gotask-taskfile')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('771dc73d1cc72df7d6584415a6dc2cddff65026afa0396debd5fb05e8118c625')

build() {
  cd "$_pkgname-$pkgver"

  mkdir -p build/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  go build -v -o build ./...
}

check() {
  cd "$_pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 build/task "${pkgdir}/usr/bin/go-task"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
