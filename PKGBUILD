# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver
pkgver=0.13.0
pkgrel=0
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse2' 'webkit2gtk')
makedepends=('pkgconf' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aa831017c4d9612fbdea1e2fab05864f84074e6b80e7613ae739d2954e7b6e975d6a1aaaaba330c0038dae69839dcf608576a96a88797cf575791fae65673d4a')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

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

  install -Dm 644 "resources/onedriver@.service" "$pkgdir"/usr/lib/systemd/user/onedriver@.service
  install -Dm 644 resources/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm 644 resources/$pkgname.png "$pkgdir"/usr/share/icons/onedriver/$pkgname.png
  install -Dm 644 resources/$pkgname.svg "$pkgdir"/usr/share/icons/onedriver/$pkgname.svg
  install -Dm 644 resources/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
