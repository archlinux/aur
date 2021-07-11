# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver
pkgver=0.11.1
pkgrel=4
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse2' 'webkit2gtk')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('da320b386dd0cefedda616d69be5e9222348d9801cab7e54a73e13f8957120d7fe241bd54a107ad549c5d3c9fe1b6088a7882252b1d37ca01623a0be0a4f05b4')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
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
