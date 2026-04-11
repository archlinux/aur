# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dmarc-cat-git
pkgver=0.15.0.r8.g7001688
pkgrel=4
pkgdesc='Small utility to decode the report sent by various email providers following the DMARC spec'
arch=('x86_64')
url='https://github.com/keltia/dmarc-cat'
license=('BSD-2-Clause')
depends=(glibc gpgme)
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --always | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  export GOPATH="${srcdir}/go"
  go mod download -modcacherw
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
    -o "${pkgname%-git}"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
