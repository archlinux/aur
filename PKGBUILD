# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=rabtap
pkgver=1.38.2
pkgrel=1
license=(GPL3)
pkgdesc="RabbitMQ wire tap and swiss army knife "
makedepends=('go')
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/jandelgado/rabtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/jandelgado/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('39219947fba103d75ccc7f8b7fd156ff3c3df5b9b3813c259a08dbb9b7753674')

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${pkgname}-${pkgver}"

  cd cmd/rabtap

  # cannot determine specific commit from GitHub tag tarballs
  CGO_ENABLED=0 go build \
    -ldflags "-X main.version=${pkgver} -X main.commit=unknown" \
    -buildmode=pie \
    -modcacherw \
    -trimpath \
    -o ../../bin/rabtap

  # clean now to ensure makepkg --clean works
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./bin/rabtap

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      ./LICENSE
}
