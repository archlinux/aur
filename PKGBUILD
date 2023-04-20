# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

_commit='192ef5303b51b5ac64a60376ea012936b9ed25fd'
pkgname=mop
pkgver=2023.04.05
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
b2sums=('5aad8f33c51c0d162dd23273405515e26dd8a80abba509692923a704fbf353be48298086d3b30ad982b60721c24bcb0d58ff013aa1ad53bf5fd3f5cbfc63c88d')

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
