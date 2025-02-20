# Maintainer:
# Contributor: peeweep <peeweep at 0x0 dot ee>

pkgname=gotags
pkgver=1.4.1
pkgrel=4
pkgdesc='ctags-compatible tag generator for Go'
arch=('x86_64')
url='https://github.com/jstemmer/gotags'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-46.patch::https://github.com/jstemmer/gotags/pull/46.patch")
sha256sums=('2df379527eaa7af568734bc4174febe7752eb5af1b6194da84cd098b7c873343'
            '246f3e75f000eb09e40ed2d8893834cd7015029607f2ef44f1d7062c5b22ef31')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "../${pkgname}-46.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
