# Maintainer: Carter Green <crtrgreen@gmail.com>
# Contributor: Mario Aichinger <aichingm@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat
pkgver=1.1.0
pkgrel=4
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('MIT')
makedepends=('go')
conflicts=('ccat-git' 'ccrypt')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b02d2c8d573f5d73595657c7854c9019d3bd2d9e6361b66ce811937ffd2bfbe1')

prepare() {
    cd "${pkgname}-${pkgver}"
    go mod init "${url#https://}" # strips https:// from URL
    go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ccat .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

