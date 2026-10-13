# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=open-code-review
pkgver=1.13.0
pkgrel=1
pkgdesc="AI-powered code review CLI (Alibaba)"
arch=('x86_64' 'aarch64')
url="https://github.com/alibaba/open-code-review"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go>=1.25' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alibaba/open-code-review/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24813c739e94985e0468a424a2e3d25c16b0caa4060be0d47f6d7a2a82fc090c')

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
