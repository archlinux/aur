# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver
pkgver=0.15.0
pkgrel=0
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse2' 'webkit2gtk-4.1')
makedepends=('pkgconf' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('726a231442bfeb2a3e00e910488fa73055751c4dbfd64d0a8249b7e11965de802701a6a107dbd427f0227abf959074ec24f1b221bb9611de841718a3a558b003')

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
  install -Dm 644 pkg/resources/$pkgname-launcher.desktop "$pkgdir"/usr/share/applications/$pkgname-launcher.desktop
  install -Dm 644 pkg/resources/$pkgname.png "$pkgdir"/usr/share/icons/onedriver/$pkgname.png
  install -Dm 644 pkg/resources/$pkgname-128.png "$pkgdir"/usr/share/icons/onedriver/$pkgname-128.png
  install -Dm 644 pkg/resources/$pkgname.svg "$pkgdir"/usr/share/icons/onedriver/$pkgname.svg
  install -Dm 644 pkg/resources/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
