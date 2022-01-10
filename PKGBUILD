# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile
_pkgname=task
pkgver=3.10.0
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go. Installs as gtask to allow coexistance with taskwarrior."
arch=('any')
url="https://github.com/go-task/task"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('4fb63ffb9e84a4c24b2bde8096a5cfe5d2cd5f340e603a7c9f4b7c11ad967e5a')

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

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 build/task "${pkgdir}/usr/bin/gtask"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
