# Maintainer: Celti B. <celti@celti.name>

pkgname=age-plugin-keystore
pkgver=1.1.0
pkgrel=1
pkgdesc='org.freedesktop.secrets plugin for age'
arch=('x86_64')
url="https://github.com/arouene/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('age: for use with age'
            'rage-encryption: for use with rage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2b41d42ec9b0bb7b244e6d91b22fffa5063943851780f599ca7289ec38abed9d')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname .
}

# These tests require an active login keyring, run at your
# own risk... or don't, if you're building in a container.
# checkdepends=('age' 'org.freedesktop.secrets')
# check() {
#   cd "$pkgname-$pkgver"
#   go test ./...
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin/" $pkgname
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}

