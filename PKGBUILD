# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

_commit='2cee51a1c03cfdf2131e6b9fdb1f8ac814f452e6'
pkgname=mop
pkgver=2024.01.14
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop-git')
options=('!emptydirs' '!lto')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mop-tracker/${pkgname}/archive/${_commit}.tar.gz")
b2sums=('783bacaea79c4972b90663445f6423f44fd2c9a27b86d2727522aa838931c53d461508939c9b2186ab6ca66fb5bfb8720fc667511ce1bc6fdb012060e1f52845')

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${_commit} -linkmode=external -extldflags ${LDFLAGS}"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${_commit}/mop" \
    "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
