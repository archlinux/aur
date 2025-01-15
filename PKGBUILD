# Maintainer: robertfoster
_pkgname=LocalAI
pkgname=local-ai
pkgver=2.25.0
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first (with OPENBlas CPU optimizations)"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${pkgname}/${pkgname}.conf")
depends=('glibc' 'openblas')
options=('!strip')
makedepends=(
  'c-ares'
  'ccache'
  'cmake'
  'git'
  'go'
  'grpc'
  'make'
  'openblas'
  'openssl'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
  're2'
  'upx'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.tmpfiles"
  "${pkgname}.sysusers"
  "${pkgname}.service"
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make get-sources
}

build() {
  GO_TAGS="stablediffusion tts p2p"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  BUILD_TYPE=openblas make build -j"$(nproc)"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" -t "${pkgdir}/usr/bin/"

  install -D -m644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  upx "${pkgdir}/usr/bin/${pkgname}"

  # systemd
  install -D -m644 "${srcdir}/${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

sha256sums=('f9d7a8ceae6987a7ad3ac3a67bc604bea2f539275015fc88203e2762ec5fc697'
  '8e530e32d96d02c01192c987e8bffaf0bb67db34bf999fccdfa8d0777789233b'
  '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
  '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
  'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c')
