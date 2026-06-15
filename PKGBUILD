# Maintainer: Anthony Vitacco <avitacco@protonmail.com>

pkgname=cowbird
pkgver=0.6.0
pkgrel=1
pkgdesc='A password manager that uses HashiCorp Vault as its backend'
arch=('x86_64' 'aarch64')
url='https://github.com/avitacco/cowbird'
license=('GPL-3.0-or-later')
makedepends=('go')
depends=('glibc')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "co.avitac.cowbird.desktop"
        "co.avitac.cowbird.svg")
sha256sums=('e6456511b4d523e40ddacd6ec4099658e584de137f4a14f7758b19b23c63e3ec'
            '609df1245b01bf12c3d1a26ca601f78b4d9786b4876f1662b31645402ea9c465'
            '0232008204af9a35532a89dbfcd3b7092193b971b8cb2f942276635267de44be')
prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go test ./...
}

package() {
  install -Dm644 "$srcdir/co.avitac.cowbird.desktop" "$pkgdir/usr/share/applications/co.avitac.cowbird.desktop"
  install -Dm644 "$srcdir/co.avitac.cowbird.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/co.avitac.cowbird.svg"
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
