# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gpbkdf2
pkgver=1.0
pkgrel=1
pkgdesc="PBKDF2 key encoder for use in shell. Single, tiny binary. Written in Go"
arch=('x86_64' 'armv7h')
url="https://github.com/riotkit-org/gpbkdf2"
license=('LGPL3')
makedepends=('go')
provides=("${pkgname-bin}")
conflicts=("${pkgname-bin}")
source=($url/archive/v$pkgver.tar.gz)
b2sums=('0dad2387dcecb654939bafd93605e28dc3eecf91338ac6f5467b14accc2387fa14bf614e747165257d83b3251cab993bed97b15bdfe5b4589e9df300ebf7dfe4')

build() {
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go mod init go.mod
  GOPATH="$srcdir" go mod tidy
  GOPATH="$srcdir" go mod download
  GOPATH="$srcdir" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w" \
    -o $pkgname .

}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
