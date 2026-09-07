# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="mixxxdb"
pkgver=0.0.2
pkgrel=1
pkgdesc="Tool for manipulating the Mixxx database."
arch=(any)
url="https://codeberg.org/SamWhited/mixxxdb"
license=(BSD-2-Clause)
makedepends=(
  go
)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/SamWhited/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('c51cc881366789638a5d241decb290daf93cfde9becbaa57c896b7c742de5b7e')

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
