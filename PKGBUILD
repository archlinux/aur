# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=redress
pkgver=1.2.44
pkgrel=1
pkgdesc="A tool for analyzing stripped Go binaries"
arch=('any')
url="https://github.com/goretk/redress"
license=('AGPL-3.0-or-later')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('26c60c539136e2f2a72ac1f28000e7139a8aa1536484b887fa2f7d1fb3a5de2b')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$pkgname-$pkgver"

  GOREVER=$(grep 'goretk/gore v' go.mod | cut -d ' ' -f 2)
  GOVER=$(go version | cut -d ' ' -f 3)
  LDEXTRA="-X \"main.redressVersion=v$pkgver\" -X \"main.goreVersion=$GOREVER\" -X \"main.compilerVersion=$GOVER\""

  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -s -w $LDEXTRA -extldflags \"${LDFLAGS}\"" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

