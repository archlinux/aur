# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=hyperfox
pkgdesc='HTTP/HTTPS MITM proxy and recorder.'
arch=(x86_64 i686 armv7h)
url='https://github.com/malfunkt/hyperfox'
_branch='master'
pkgver=2.0.0
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('210e711f12f2316a329600b8096ba6406253d67ea6d8e5a9aaf28b0cd1f84075')
sha512sums=('b731e43ff4b5aa670e1e4f270f73b41a799cbfafed78ed8951659ccde5fe7f6c9ba6d6a8d029a3727367be3a77bcf20351ea95f59c2849b577779381116d487c')
b2sums=('9669a2a6f15588e09d5933351005bc640c0bc354c6ce1a58dff1b704b4e67947baffbd13738edae619e0ad766d7867fc06ad4a5f738f04915aa45d8564ec3aa2')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
