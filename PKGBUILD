# Maintainer: robertfoster
_pkgbase=local-ai
_pkgname=LocalAI
pkgname="${_pkgbase}-sycl-f32"
pkgver=2.27.0 # renovate: datasource=github-tags depName=mudler/LocalAI
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first (with Intel SYCL GPU optimizations and F32)"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${_pkgbase}/${_pkgbase}.conf")
depends=('intel-oneapi-basekit')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
options=('!strip')
makedepends=(
  'c-ares'
  'ccache'
  'cmake'
  'git'
  'go'
  'grpc'
  'make'
  'openssl'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
  're2'
  'upx'
)
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${_pkgbase}.conf"
  "${_pkgbase}.tmpfiles"
  "${_pkgbase}.sysusers"
  "${_pkgbase}.service"
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make get-sources
}

build() {
  GO_TAGS="stablediffusion tts p2p"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  source /opt/intel/oneapi/setvars.sh
  BUILD_TYPE=sycl_f32 make build -j"$(nproc)"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm775 "${_pkgbase}" -t "${pkgdir}/usr/bin/"

  install -D -m644 "${srcdir}/${_pkgbase}.conf" \
    "${pkgdir}/etc/${_pkgbase}/${_pkgbase}.conf"

  upx "${pkgdir}/usr/bin/${_pkgbase}"

  # systemd
  install -D -m644 "${srcdir}/${_pkgbase}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${_pkgbase}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
  install -D -m644 "${srcdir}/${_pkgbase}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}

sha256sums=('595ade8031a8f7d4fd23c4e3a5c24b37f542059f3585c9f15352da4fb79c06e0'
            '8e530e32d96d02c01192c987e8bffaf0bb67db34bf999fccdfa8d0777789233b'
            '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c')
