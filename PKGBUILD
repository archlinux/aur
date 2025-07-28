# Maintainer: robertfoster
_pkgname=LocalAI
pkgname=local-ai
pkgver=3.2.3 # renovate: datasource=github-tags depName=mudler/LocalAI
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${pkgname}/${pkgname}.conf")
depends=('openblas')
makedepends=(
  'go'
  'make'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.tmpfiles"
  "${pkgname}.sysusers"
  "${pkgname}.service"
)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  commit=$(git ls-remote --tags https://github.com/mudler/LocalAI.git refs/tags/v${pkgver} | cut -f1)

  make protogen-go
  CGO_ENABLED=0 \
    go build \
    -ldflags "-s -w -X github.com/mudler/LocalAI/internal.Version=v${pkgver} \
    -X github.com/mudler/LocalAI/internal.Commit=${commit}" \
    -o local-ai \
    .
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  # systemd
  install -D -m644 "${srcdir}/${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

sha256sums=('efc1f805e9acc1a9fbd29801e69e307de1f767671dd280a4909297c74f5e6178'
  'ad8459c708f6e4413d4d2d0c5dda71dc9a13860c1a8641d72f49cf9cf259768e'
  '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
  '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
  'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c')
