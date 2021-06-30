# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=footloose
pkgver=0.6.4
pkgrel=1
pkgdesc="Containers that look like Virtual Machines"
arch=('x86_64')
url="https://github.com/weaveworks/footloose"
license=('Apache')
makedepends=('go' 'git')
optdepends=(
  'ignite: for ignite runtime backend'
  'docker: for docker runtime backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('304722e3f09a231edd06db1bc76c554cb7adb18bb8d746908e2089e93d8af9a90264fcf2d7219afb67ff1494efbf9cdba533a875ec0d7d5383ef872a6f55b58d')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build .
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
  
  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr examples "$pkgdir/usr/share/doc/$pkgname"
}
