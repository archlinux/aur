# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgbase=ssh3
pkgname=(ssh3 ssh3-server)
pkgver=0.1.6
pkgrel=1
pkgdesc='faster and rich secure shell using HTTP/3'
url='https://github.com/francoismichel/ssh3'
license=('Apache-2.0')
arch=('x86_64')
depends=('glibc')
makedepends=('go' 'libxcrypt')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/francoismichel/ssh3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e87e654bead259fa4885802f8b2c6f7bfbde408f70fd53df92409b26dcb6e0f')
b2sums=('a968ef563056953f46e2c77bacaa45ff7304be976e1c9e92583ecfb4429d70b703ebd9d4d72dcb54ca450b9b2d9c55b42ade006c2a4b89c13d36dfd3d1ead30e')

build() {
  cd "$pkgbase-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  local builddate=$(date +%Y-%m-%d)
  local linkflags="-X main.version=$pkgver -X main.buildDate=$builddate"

  go build -ldflags "$linkflags" -o ssh3 ./cmd/ssh3
  go build -ldflags "$linkflags" -o ssh3-server ./cmd/ssh3-server
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
