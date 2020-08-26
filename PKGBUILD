# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=topicctl-git
_pkgname=${pkgname%-git}
pkgver=0+r55+g4bca417
pkgrel=1
pkgdesc='Declarative management of Kafka topics (git)'
arch=(x86_64)
url=https://github.com/segmentio/$_pkgname
license=(MIT)
depends=(glibc)
makedepends=(git go)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  go build \
    -buildmode pie \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -mod readonly \
    -modcacherw \
    -trimpath \
    ./cmd/$_pkgname
}

check() {
  cd $_pkgname
  make test || warning "Tests failed"
}

package() {
  cd $_pkgname
  install -D $_pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$_pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$_pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
