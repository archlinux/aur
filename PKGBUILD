# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=gitlab-ci-linter
pkgver=2.4.0
pkgrel=1
pkgdesc='Tool for validating .gitlab-ci.yml using Gitlab API'
url='https://gitlab.com/orobardet/gitlab-ci-linter'
arch=('aarch64' 'x86_64')
license=('MIT')
conflicts=("$pkgname-bin")
depends=('glibc')
makedepends=('git' 'go')

source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('caacfabcb3e5d01b821c685d443b709c464b999a60f72bd67ead4a2d991547d7')

prepare() {
  cd "$pkgname-v$pkgver"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-v$pkgver"

  BUILDTIME="$(date +%FT%T%z)"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X ${url#*//}/config.VERSION=$pkgver -X ${url#*//}/config.REVISION=$pkgrel -X ${url#*//}/config.BUILDTIME=${BUILDTIME}" -o "$pkgname"
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
