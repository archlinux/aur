# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=dmarc-report-converter
pkgver='0.7.2'
pkgrel=1
pkgdesc='Convert DMARC reports from XML to human-readable formats'
arch=('x86_64')
url='https://github.com/tierpod/dmarc-report-converter'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/tierpod/dmarc-report-converter#tag=v${pkgver}"
        'config.yml'
        'change-default-path-of-config-file.patch')
b2sums=('SKIP'
        '7047b02100027203d7c0978f1607f41b0bccdb79a8c4a8f59bcf4f89ff2d9b9903cb8c5060a295a12a9ebfe8a378163e4ae3c61ddb181f58a236489fb2a5eb47'
        '32bcd4559337c2cf67f4f30bbe737e5d902888d107208ea1a39218158043e9c56d7f3875f3aea1e61136fd8569f424919da58556435a72c09d27ef7f5e6d3b27')
backup=('etc/dmarc-report-converter/config.yml')

prepare() {
  cd "dmarc-report-converter"

  patch -p1 -i ../change-default-path-of-config-file.patch
}

build() {
  cd "dmarc-report-converter"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags="-linkmode=external -X main.version=${pkgver}" \
    -o dist/ \
    ./cmd/...
}

check() {
  cd "dmarc-report-converter"

  find ./cmd ./pkg -type f -name '*.go' | xargs gofmt -l -e

  go vet -mod=vendor ./cmd/... ./pkg/...
  go test -mod=vendor ./cmd/... ./pkg/...
}

package() {
  cd "dmarc-report-converter"

  install -Dm755 dist/dmarc-report-converter -t "${pkgdir}/usr/bin"
  install -Dm644 ../config.yml -t "${pkgdir}/etc/${pkgname}"

  install -Dm644 install/dmarc-report-converter.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 install/dmarc-report-converter.timer -t "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a --no-preserve=ownership assets "${pkgdir}/usr/share/${pkgname}/assets"

  install -d "${pkgdir}/var/lib/${pkgname}/inputs"
  install -d "${pkgdir}/var/lib/${pkgname}/outputs"
  install -d "${pkgdir}/var/lib/${pkgname}/templates"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
