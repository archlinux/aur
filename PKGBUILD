# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

pkgname=mop
pkgver=1.0.0
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop-git')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mop-tracker/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('1608edc521e959d932a7b4a49f29a04ddff1a259e49be36d20694c15419bee542b7983fd6ac4a6f6475aa3765cf762fdd2bb7ed8de0e6dede050ebd740c9754b')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${pkgver} -extldflags ${LDFLAGS}"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/mop" \
    "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
