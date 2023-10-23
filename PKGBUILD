# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver
pkgver=0.14.1
pkgrel=0
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse2' 'webkit2gtk')
makedepends=('pkgconf' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ff0284c960f9ad9d9e71867fc65b5ca78e3724d984fdbaec1d7dd7232d83f8335335cb779d3d53bf6dca13474b9a2fb3dd8248620d50b0c65fe91914396a094e')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  bash cgo-helper.sh

  go build \
    -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.commit=$(git rev-parse HEAD) -linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/onedriver

  export CGO_CFLAGS="-Wno-deprecated-declarations ${CFLAGS}"

  go build \
    -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.commit=$(git rev-parse HEAD) -linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/onedriver-launcher
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 $pkgname-launcher "$pkgdir"/usr/bin/$pkgname-launcher

  install -Dm 644 "pkg/resources/onedriver@.service" "$pkgdir"/usr/lib/systemd/user/onedriver@.service
  install -Dm 644 pkg/resources/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm 644 pkg/resources/$pkgname.png "$pkgdir"/usr/share/icons/onedriver/$pkgname.png
  install -Dm 644 pkg/resources/$pkgname-128.png "$pkgdir"/usr/share/icons/onedriver/$pkgname-128.png
  install -Dm 644 pkg/resources/$pkgname.svg "$pkgdir"/usr/share/icons/onedriver/$pkgname.svg
  install -Dm 644 pkg/resources/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
