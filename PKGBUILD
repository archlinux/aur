# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='runitor'
pkgver=1.4.1
pkgrel=1
pkgdesc='Command runner with healthchecks.io integration'
arch=('x86_64')
url='https://github.com/bdd/runitor'
license=('0BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('192665c623bc96ed77f122510510c017197e1673ab92bb84546d652afe4416c0')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -v -o "build/${pkgname}" -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ."/cmd/${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

