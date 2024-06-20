# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=dmarc-report-converter
pkgver='0.8.1'
pkgrel=1
pkgdesc='Convert DMARC reports from XML to human-readable formats'
arch=('x86_64')
url='https://github.com/tierpod/dmarc-report-converter'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!debug')
source=("${pkgname}-${pkgver}::git+https://github.com/tierpod/dmarc-report-converter.git#tag=v${pkgver}"
        'config.yml'
        'dmarc-report-converter.service'
        'dmarc-report-converter.timer'
        'change-default-path-of-config-file.patch')
b2sums=('6a03c787f3bb5389605587e2eab489737881d1fa64de95cdb0c24c1ef93f5e2a9d7789101b00d4df73b761ef053b46d47b56a408f839f0951ac6694e43ab8bc1'
        '7047b02100027203d7c0978f1607f41b0bccdb79a8c4a8f59bcf4f89ff2d9b9903cb8c5060a295a12a9ebfe8a378163e4ae3c61ddb181f58a236489fb2a5eb47'
        '47ea048087d075d030b087a577968d999c891437da0e43aa919eb2ce756885e614b1ef1fa31a96880e16f0a9d75b609c7e2d95c536feac9e59aa5aa3e6ffa3d6'
        'f60f37cacff1384b3b60236c13bd5303728f8f2aa22a561d8dbdb43020f0db47b89babcf30cafc4d9ce12783935b4c1c41507fa218cea61a3cca68a1d03b9852'
        '32bcd4559337c2cf67f4f30bbe737e5d902888d107208ea1a39218158043e9c56d7f3875f3aea1e61136fd8569f424919da58556435a72c09d27ef7f5e6d3b27')
backup=('etc/dmarc-report-converter/config.yml')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../change-default-path-of-config-file.patch
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
    -mod=vendor \
    -modcacherw \
    -ldflags="-linkmode=external -X main.version=${pkgver} -buildid=" \
    -o dist/ \
    ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"

  go vet -mod=vendor ./cmd/... ./pkg/...
  go test -mod=vendor ./cmd/... ./pkg/...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 dist/dmarc-report-converter -t "${pkgdir}/usr/bin"
  install -Dm644 ../config.yml -t "${pkgdir}/etc/${pkgname}"

  install -Dm644 ../dmarc-report-converter.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 ../dmarc-report-converter.timer -t "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a --no-preserve=ownership assets "${pkgdir}/usr/share/${pkgname}/assets"

  install -d "${pkgdir}/var/lib/${pkgname}/inputs"
  install -d "${pkgdir}/var/lib/${pkgname}/outputs"
  install -d "${pkgdir}/var/lib/${pkgname}/templates"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
