# Maintainer: robertfoster
pkgname=local-ai
_pkgname=LocalAI
pkgver=2.6.0
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first."
arch=('aarch64' 'x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/conf.d/${pkgname}.conf")
depends=('glibc')
makedepends=('c-ares' 'cmake' 'git' 'go' 'grpc' 'make' 'openssl' 're2')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.tmpfiles"
  "${pkgname}.sysusers"
  "${pkgname}.service"
)

prepare() {
  export GO_TAGS="tinydream tts"

  cd "${srcdir}/${_pkgname}-${pkgver}"

  make get-sources
}

build() {
  export GO_TAGS="tinydream tts"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm775 "${pkgname}" -t "${pkgdir}/usr/bin/"

  install -D -m644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/conf.d/${pkgname}.conf"

  # systemd
  install -D -m644 "${srcdir}/${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

sha256sums=('aebac4ff3d1675ba19a273e7d51bab3e39ee273b53a65b1f6be18a19e3cadb3d'
            'a642a3eda0fe24fa2ebffc5ec997fdbcc2ee74b615045fe5f0e40c4efc7b8399'
            '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            'affefb565e63f19fbdad53032c090fc33c2aa8ce986ba9cf678ccf071c2d67bf')
