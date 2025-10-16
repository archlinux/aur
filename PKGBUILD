# Maintainer: robertfoster
pkgname=agentgateway-bin # renovate: datasource=github-releases depName=agentgateway/agentgateway
pkgver=0.10.3
pkgrel=1
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
source_x86_64=("${url}/releases/download/v${pkgver}/agentgateway-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/agentgateway-linux-arm64")

sha256sums=('ccbf401f366bd723ff37c7ff726861addc4f023acfd13947c4154fd1865aaca8'
  '27f129b0434a4bb00a276f9c391dab3280cf9c657fefd1b358aded52c7937afb'
  '1ade18462998f6f52b533bb423803c2d41c8b944bf2528d6de9302ee9163a583'
  'ba427c38951680ce792919096aed859f6fe44e5bbde3b48d98411478ebb3500c')
sha256sums_x86_64=('eabbc488e7a30b5f2e4dc669fa40bcec0d9f2358b2da1ccfc73294c68b70a296')
sha256sums_aarch64=('4e8c01f114f5d50ede33603d7bb356ad556818a0acc0fcbaefef56a4199e8862')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-linux-amd64" \
      "${pkgdir}/usr/bin/${pkgname%%-bin}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname%%-bin}-linux-arm64" \
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
