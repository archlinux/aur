# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="mkastem"
pkgver=0.0.5
pkgrel=1
pkgdesc="Tool for manipulating stem files in Matroska format."
arch=(any)
url="https://codeberg.org/SamWhited/mkastem"
license=(CC0-1.0)
depends=(
  ffmpeg
  mkvtoolnix-cli
  mpv
)
makedepends=(
  go
)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/SamWhited/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('14e3548c337067d460aa00197f09a7d94beb34334f149f2cbb50f6d59dad7a2d')

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
}

# vim:set ts=2 sw=2 et:
