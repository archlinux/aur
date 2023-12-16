# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgbase=ssh3
pkgname=(ssh3 ssh3-server)
pkgver=0.1.4
pkgrel=1
pkgdesc='faster and rich secure shell using HTTP/3'
url='https://github.com/francoismichel/ssh3'
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/francoismichel/ssh3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('453f741934298f086b3cf4c99f8856d151a2ee3b14ef123139b39ea66c642e02')
b2sums=('2ab566ef522d1565faef513c5d53737db717d61f5c409e72cea7c5ceb7adf214b8d6c9f2f0af86991fcf5e722863a252971dbff5fe500be1c619ff6da3d1b560')

build() {
  cd "$pkgbase-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ssh3 cli/client/main.go
  go build -o ssh3-server cli/server/main.go
}

package_ssh3() {
  cd "$pkgbase-$pkgver"

  install -Dm0755 ssh3 "$pkgdir/usr/bin/ssh3"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ssh3-server() {
  depends+=('libxcrypt')

  cd "$pkgbase-$pkgver"

  install -Dm0755 ssh3-server "$pkgdir/usr/bin/ssh3-server"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
