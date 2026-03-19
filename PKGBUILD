# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=bat-cli
pkgver='1.1'
pkgrel=6
pkgdesc='Battery management utility for Linux laptops'
arch=('x86_64')
url='https://github.com/tshakalekholoane/bat'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tshakalekholoane/bat/archive/refs/tags/${pkgver}.tar.gz"
        'rename-binary-to-bat-cli.patch')
b2sums=('b95fcebac70a6163b12daccc5c3132ce1355feda2b76463955f5d3c42093ffbc1c2f10f5d490fa344e8eb38ff7be9a1485802f98b4e5b8cb3e47bafc2ff906cb'
        '451a058d29b8b70311fc00659c45ad89081b70d51df3f64f75dc52ad63e0ad55b317c92b8e61e6ae01139d74c0dc0b9fad7ff7409024c476cc0af31f4099300c')

prepare() {
  cd "bat-${pkgver}"

  patch -p1 -i ../rename-binary-to-bat-cli.patch
}

build() {
  cd "bat-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X main.tag=${pkgver}" \
    -o dist/ \
    ./...
}

check() {
  cd "bat-${pkgver}"

  go vet ./...
}

package() {
  cd "bat-${pkgver}"

  install -Dm755 ./dist/bat "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ./bat.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
