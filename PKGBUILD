# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="mkastem"
pkgver=0.0.4
pkgrel=1
pkgdesc="Tool for manipulating stem files in Matroska format."
arch=(any)
url="https://codeberg.org/SamWhited/mkastem"
license=(CC0-1.0)
depends=(
  ffmpeg
  mkvtoolnix-cli
)
makedepends=(
  go
)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/SamWhited/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('0c814671c6ddd5690c58a61f50391eb8cdd5db5ae3b362b10fe25411dfcb2ed6')

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
