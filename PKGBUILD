# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=topicctl
pkgver=0+r55+g4bca417
_commit=4bca41738e78c3eb77e4ffa5e6843c176e9fca48
pkgrel=1
pkgdesc='Declarative management of Kafka topics'
arch=(x86_64)
url=https://github.com/segmentio/$pkgname
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=(git+https://github.com/segmentio/$pkgname#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  go build \
    -buildmode pie \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -mod readonly \
    -modcacherw \
    -trimpath \
    ./cmd/$pkgname
}

check() {
  cd $pkgname
  make test || warning "Tests failed"
}

package() {
  cd $pkgname
  install -D $pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
