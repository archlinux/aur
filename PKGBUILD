# Maintainer: robertfoster
pkgname=agentgateway-bin
pkgver=1.5.0 # renovate: datasource=github-releases depName=agentgateway/agentgateway
pkgrel=2
pkgdesc="Next Generation Agentic Proxy for AI Agents and MCP servers"
arch=('x86_64' 'aarch64')
url="https://github.com/agentgateway/agentgateway"
license=('Apache-2.0')
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}")
replaces=("${pkgname%%-bin}")
backup=("etc/${pkgname%%-bin}/${pkgname%%-bin}.yaml")

source=(
  "${pkgname%%-bin}.service"
  "${pkgname%%-bin}.sysusers"
  "${pkgname%%-bin}.tmpfiles"
  "${pkgname%%-bin}.yaml"
)
source_x86_64=("${pkgname%%-bin}-${pkgver}-amd64::${url}/releases/download/v${pkgver}/agentgateway-linux-amd64")
source_aarch64=("${pkgname%%-bin}-${pkgver}-arm64::${url}/releases/download/v${pkgver}/agentgateway-linux-arm64")

sha256sums=('ccbf401f366bd723ff37c7ff726861addc4f023acfd13947c4154fd1865aaca8'
            '27f129b0434a4bb00a276f9c391dab3280cf9c657fefd1b358aded52c7937afb'
            '1ade18462998f6f52b533bb423803c2d41c8b944bf2528d6de9302ee9163a583'
            '4c6940d0a7de2eee1a6dbeb830d896c7ed5494df9aef0f9762b0d5509dc216d8')
sha256sums_x86_64=('daca5cda76e8c5ab0c1a75912fecf2d6365095403f810db72029c49d14a37e7b')
sha256sums_aarch64=('61f12dbb99669aa4b97b85a0040183fe4b098fa0a82a8c389665fe606517c13e')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-${pkgver}-amd64" \
      "${pkgdir}/usr/bin/${pkgname%%-bin}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-${pkgver}-arm64" \
      "${pkgdir}/usr/bin/${pkgname%%-bin}"
  fi

  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%%-bin}.service"

  # Install systemd sysusers file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%%-bin}.conf"

  # Install systemd tmpfiles file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%%-bin}.conf"

  # Install default configuration file
  install -Dm644 "${srcdir}/${pkgname%%-bin}.yaml" \
    "${pkgdir}/etc/agentgateway/${pkgname%%-bin}.yaml"
}
