# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=cursus
pkgver=2.0.24
pkgrel=1
pkgdesc='Writes your commands history into an sqlite db'
arch=('x86_64')
url='https://gitlab.com/n0r1sk/cursus'
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
makedepends=(go)
options=(!lto)
source=("$url/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.bz2")
sha256sums=('f7cf3c4ad4ccf04979993822a7dd6f0d733b6d74599a611acc2832c265cad82e')

prepare(){
    cd "$pkgname-v$pkgver"
    export GOPATH="${srcdir}"
    go mod download
}

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -extldflags $LDFLAGS" \
    -o $pkgname
}

package() {
  cd $pkgname-v$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
