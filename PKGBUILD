# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="mixxxdb"
pkgver=0.0.1
pkgrel=1
pkgdesc="Tool for manipulating the Mixxx database."
arch=(any)
url="https://codeberg.org/SamWhited/mixxxdb"
license=(BSD-2-Clause)
makedepends=(
  go
)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/SamWhited/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('65fb30d744d51594315f9e3c291b2ced71d122ffe0add0bd1e25e2090605f721')

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.version=v${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${pkgname}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
