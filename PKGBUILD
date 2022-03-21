# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-teleport
pkgver=0.3.0
pkgrel=2
pkgdesc="An OBS Studio plugin for an open NDI-like replacement. Pretty simple, straight forward. No NDI compatibility in any form"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/teleport.1445/"
license=("GPL2")
depends=("obs-studio" "libjpeg")
makedepends=("go")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fzwoch/obs-teleport/archive/$pkgver.tar.gz"
)
sha256sums=("b3259a2342b66638447b9cff9b4b1b5716b11c038fef5ec2927d24b1a352e789")

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
