# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='ftpgrab'
pkgver=7.13.0
pkgrel=1
pkgdesc='Grab your files periodically from a remote FTP or SFTP server easily'
arch=('x86_64')
url='https://github.com/crazy-max/ftpgrab'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('214646f3750ab39068f752f30b903a91b70d3616b14ea3989f856d3430d6fbfc')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -v -o "build/${pkgname}" -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

