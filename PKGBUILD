# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-vault
pkgver=5.4.3
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
makedepends=('go')
optdepends=('zenity: graphical prompt'
            'kdialog: graphical prompt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2174413fd5ea7eb2f7ee0bbc393667a1044800e108ab6b8300331ec15d9ed01a')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  go build \
    -ldflags="-extldflags '$LDFLAGS' -X main.Version=v$pkgver" \
    -o $pkgname .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
