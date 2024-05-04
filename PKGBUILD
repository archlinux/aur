# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=bat-cli
pkgver='1.1'
pkgrel=1
pkgdesc='Battery management utility for Linux laptops.'
arch=('x86_64')
url='https://github.com/tshakalekholoane/bat'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/tshakalekholoane/bat#tag=${pkgver}"
        'rename-binary-to-bat-cli.patch')
b2sums=('SKIP'
        '451a058d29b8b70311fc00659c45ad89081b70d51df3f64f75dc52ad63e0ad55b317c92b8e61e6ae01139d74c0dc0b9fad7ff7409024c476cc0af31f4099300c')

prepare() {
  cd bat

  patch -p1 -i ../rename-binary-to-bat-cli.patch

  # replace expected version string in main_test.go
  sed -i "s/git describe --always --dirty --tags --long/echo ${pkgver}/g" main_test.go
}

build() {
  cd bat

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X main.build=$(date -u +'%Y-%m-%d') -X main.tag=${pkgver}" \
    -o dist/ \
    ./...
}

check() {
  cd bat

  go test \
    -v \
    -race \
    -vet=off \
    -ldflags="-linkmode=external -X tshaka.dev/x/bat.build=$(date -u +'%Y-%m-%d') -X tshaka.dev/x/bat.tag=${pkgver}" \
    ./...
  go vet ./...
}

package() {
  cd bat

  install -Dm755 ./dist/bat "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ./bat.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
