# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=gostc
pkgver=2.0.11
pkgrel=1
pkgdesc='frp-based NAT traversal management client'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/SianHH/gostc-open'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/SianHH/gostc-open/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '941d1bd9e76480afa6b2abd373582252e2d530fbed654b2f843a824637e81a71'
)

prepare() {
  cd "gostc-open-$pkgver/client"
  export GOPATH="${srcdir}"
  # Keep the module cache inside the build environment.
  go mod download -modcacherw
}

build() {
  cd "gostc-open-$pkgver/client"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  # Upstream goreleaser config only adds -s -w (stripped by pacman anyway);
  # bypass the Makefile and honor the Arch hardening flags instead.
  go build -o build/gostc ./cli/
}

package() {
  cd "gostc-open-$pkgver/client"
  install -Dm755 build/gostc "$pkgdir/usr/bin/gostc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
