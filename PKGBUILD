# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=bat-cli
pkgver='1.1'
pkgrel=4
pkgdesc='Battery management utility for Linux laptops'
arch=('x86_64')
url='https://github.com/tshakalekholoane/bat'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+https://github.com/tshakalekholoane/bat.git#tag=${pkgver}"
        'rename-binary-to-bat-cli.patch')
b2sums=('ebe66d991a83e6b9c4f0e0426088ce87a3ed8e155b5e3da7be4976c5ccb69898650aeac54ec70f02ea2d55e0dee69ef0ccc21c5c2617be6e529d8b11b4745926'
        '451a058d29b8b70311fc00659c45ad89081b70d51df3f64f75dc52ad63e0ad55b317c92b8e61e6ae01139d74c0dc0b9fad7ff7409024c476cc0af31f4099300c')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../rename-binary-to-bat-cli.patch
}

build() {
  cd "${pkgname}-${pkgver}"

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
  cd "${pkgname}-${pkgver}"

  go vet ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 ./dist/bat "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ./bat.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
