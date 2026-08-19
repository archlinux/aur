# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=imgproxy
pkgdesc="Fast and secure standalone server for resizing and converting remote images"
pkgver=4.0.13
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/imgproxy/imgproxy"
license=('Apache-2.0')
depends=('libvips>=8.10')
makedepends=('go' 'rsync')
source=("https://github.com/imgproxy/imgproxy/archive/v${pkgver}.tar.gz")
sha256sums=('4856865b2fe70058cfcfb993388251535977d30abeb65c50af613c40cbac8a31')

build() {
  cd "$pkgname-$pkgver"
  env CGO_LDFLAGS_ALLOW="-s|-w" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o "$pkgname" \
    ./cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}