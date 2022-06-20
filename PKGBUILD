pkgname=base16-builder-go
_cmd='base16-builder'
provides=("${_cmd}")
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple builder for base16 templates and schemes'
arch=('x86_64')
url="https://github.com/belak/base16-builder-go"
makedepends=()
makedepends=('git' 'go')
source=("$url/archive/v${pkgver}.zip")
sha256sums=('94965f9e3efb2073fccccb4bf0bfeedd4e4bd5afe780c3c4ee794b652784c5a3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git clone https://github.com/base16-project/base16-schemes.git schemes
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${provides[0]} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" .
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${_cmd}" "${pkgdir}/usr/bin/${_cmd}"
}
