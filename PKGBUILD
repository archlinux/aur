# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver
pkgver=0.10.1
pkgrel=1
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse2' 'webkit2gtk')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8fb9d12dbcdaa96774d03458fcac7e64ba9fa0938c1a1615937587fe93e1352606a42acdd2062e3f492c7b290e61fbbbb167c6dbc68e93d282c95ae780152ec2')

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
    -ldflags "-X main.commit=f560cbe48072bd8f88a44de038c1928e30608d14 -linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 resources/$pkgname-launcher.sh "$pkgdir"/usr/bin/$pkgname-launcher.sh

  install -Dm 644 "resources/onedriver@.service" "$pkgdir"/usr/lib/systemd/user/onedriver@.service
  install -Dm 644 resources/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm 644 resources/$pkgname.png "$pkgdir"/usr/share/icons/onedriver/$pkgname.png
  install -Dm 644 resources/$pkgname.svg "$pkgdir"/usr/share/icons/onedriver/$pkgname.svg
}
