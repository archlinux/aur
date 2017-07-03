# Maintainer : Kevin MacMartin <prurigro@gmail.com>

_pkgname=goofys
pkgname=$_pkgname-git
pkgver=356v0.0.13
pkgrel=1
pkgdesc='A high-performance, POSIX-ish Amazon S3 file system written in Go'
url='https://github.com/kahing/goofys'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'godep')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
source=('git+https://github.com/kahing/goofys')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf '%s' "$(git rev-list --count HEAD)$(git log | egrep -o 'v[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9a-z]*' | head -n 1)"
}

prepare() {
  cd $_pkgname
  sed -i 's|github\.com/kahing/goofys/|./|' main.go
}

build() {
  cd $_pkgname
  export GOPATH="$srcdir"
  go get -d -tags purego
  go build -i -v -ldflags -w
}

package() {
  # Install license
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the binary
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
