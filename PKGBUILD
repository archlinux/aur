# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

_commit='7c1fae596cdbd0a99513ba641cdeaf687224bc21'
pkgname=mop
pkgver=2021.05.18
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop-git')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mop-tracker/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('0e744348da956e083048f394121f18ebe43fb911020998cf3a9e8d45b5a561f2')

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${_commit} -extldflags ${LDFLAGS}"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${_commit}/mop" \
    "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
