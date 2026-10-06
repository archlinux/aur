# Maintainer: Andy Alt <arch_stanton5995@proton.me>
# Contributor: Ray Shirohara <RShirohara@gmail.com>

pkgname=textimg
pkgver=3.2.3
pkgrel=1
pkgdesc='Command to convert from color text (ANSI or 256) to image.'
arch=('x86_64')
url='https://github.com/jiro4989/textimg'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('noto-fonts-cjk: Default font used in linux')
provides=('textimg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c9d88a8c9dcaab794d35db014dd48a33d45ea876ab2f423d48ff6778ae4b4339')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags "-linkmode=external"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test -cover ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -Dm644 docs/* "${pkgdir}/usr/share/doc/${pkgname}/docs/"
  install -Dm644 completions/bash/textimg "${pkgdir}/usr/share/bash-completion/completions/textimg"
  install -Dm644 completions/zsh/_textimg "${pkgdir}/usr/share/zsh/site-functions/_textimg"
}
