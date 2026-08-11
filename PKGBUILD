# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=open-code-review
pkgver=1.9.1
pkgrel=1
pkgdesc="AI-powered code review CLI (Alibaba)"
arch=('x86_64' 'aarch64')
url="https://github.com/alibaba/open-code-review"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go>=1.25' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alibaba/open-code-review/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dbeadbcfe1d29c63e4adb21a4a6c1885b1d234b7b530c8f5ad9a47f419b4e1e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags "-X main.Version=v${pkgver}" \
    -o dist/opencodereview ./cmd/opencodereview
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # binary (upstream installs it as the 'ocr' command)
  install -Dm755 dist/opencodereview "${pkgdir}/usr/bin/ocr"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
