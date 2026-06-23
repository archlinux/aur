# Maintainer: Anthony Vitacco <avitacco@protonmail.com>

pkgname=cowbird
pkgver=0.11.0
pkgrel=1
pkgdesc='A password manager that uses HashiCorp Vault as its backend'
arch=('x86_64' 'aarch64')
url='https://github.com/cowbird-labs/cowbird-desktop'
license=('GPL-3.0-or-later')
makedepends=('go')
depends=('glibc')
options=('!debug')
source=("$pkgname-desktop-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "co.avitac.cowbird.desktop"
        "co.avitac.cowbird.svg")
sha256sums=('334e8cbbd855034f2bf41464c7ba380b86679a4961085ec206cd29c573f4188f'
            'f4d6a801a301a0da67611fb2bd8534382424893a03474b87d4728933b3ed754b'
            '0232008204af9a35532a89dbfcd3b7092193b971b8cb2f942276635267de44be')
prepare() {
  cd "$pkgname-desktop-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-desktop-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname-desktop" .
}

check() {
  cd "$pkgname-desktop-$pkgver"
  export GOPATH="$srcdir"
  go test ./...
}

package() {
  install -Dm644 "$srcdir/co.avitac.cowbird.desktop" "$pkgdir/usr/share/applications/co.avitac.cowbird.desktop"
  install -Dm644 "$srcdir/co.avitac.cowbird.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/co.avitac.cowbird.svg"
  cd "$pkgname-desktop-$pkgver"
  install -Dm755 "$pkgname-desktop" "$pkgdir/usr/bin/$pkgname"
}
