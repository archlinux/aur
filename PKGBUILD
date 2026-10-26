# Maintainer: shbernal <shbernal.01@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=5.1.3
pkgrel=2
pkgdesc="In-depth attack surface mapping and asset discovery"
arch=('x86_64')
url="https://owasp.org/www-project-amass"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/owasp-amass/amass/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('92e8a426f1d2c7bda1c5c885910816456a66ae7810b0d1ce28a8cf497360c5b269e90cd01eaf2f0f0248243054a8165f06678414720938d43462e5aac99cb4eb')

build() {
  cd "$pkgname-$pkgver"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-compressdwarf=false -linkmode external" \
    -o amass ./cmd/amass
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 amass "${pkgdir}/usr/bin/amass"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
