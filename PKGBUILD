# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-teleport
pkgver=0.6.5
pkgrel=1
pkgdesc="An OBS Studio plugin for an open NDI-like replacement. Pretty simple, straight forward. No NDI compatibility in any form"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/teleport.1445/"
license=("GPL2")
depends=("obs-studio" "libjpeg")
makedepends=("go")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fzwoch/obs-teleport/archive/$pkgver.tar.gz"
)
sha256sums=("a86b1ad26c7d7dd0f61dbee4a6944515c7abbda1103aff7a41cd4239e6964310")

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS} -I/usr/include/obs"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS} -ljpeg -lobs -lobs-frontend-api"
  export GOFLAGS="-buildmode=c-shared -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -X main.version=$pkgver" \
    -v -o "$pkgname.so" .
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "$pkgname.so" -t "$pkgdir"/usr/lib/obs-plugins/
}
