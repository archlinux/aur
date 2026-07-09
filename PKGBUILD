# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=bunny-cli-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Command-line interface for bunny.net"
arch=('x86_64' 'aarch64')
url="https://github.com/BunnyWay/cli"
license=('unknown')
depends=('glibc')
provides=('bunny-cli' 'bunnycdn-cli')
conflicts=('bunny-cli' 'bunnycdn-cli')
options=('!strip')
source=(
  "README-${pkgver}.md::https://raw.githubusercontent.com/BunnyWay/cli/v${pkgver}/packages/cli/README.md"
  "package-${pkgver}.json::https://raw.githubusercontent.com/BunnyWay/cli/v${pkgver}/packages/cli/package.json"
)
source_x86_64=("bunny-${pkgver}-linux-x64::https://github.com/BunnyWay/cli/releases/download/v${pkgver}/bunny-linux-x64")
source_aarch64=("bunny-${pkgver}-linux-arm64::https://github.com/BunnyWay/cli/releases/download/v${pkgver}/bunny-linux-arm64")
sha256sums=('ea84da7591e81d050c559ee4fe17cacda8b4ec3c2649ca3893b22532545bfe5f'
            '69705dbb5ff26fc26fced3cd01a44ada97c38c5fe78cd35ecd2ceda5f7f906d5')
sha256sums_x86_64=('3633b249e80b6a2521af3fac457f19a25790e879067e03410949de44695a6e47')
sha256sums_aarch64=('42c8f489b424e185162f95bb7b1beb54be0b7c973f9a9cdd636fc2b457e1885f')

_binary_name() {
  case "${CARCH}" in
    x86_64) echo "bunny-${pkgver}-linux-x64" ;;
    aarch64) echo "bunny-${pkgver}-linux-arm64" ;;
  esac
}

prepare() {
  chmod +x "${srcdir}/$(_binary_name)"
}

check() {
  "${srcdir}/$(_binary_name)" --version | grep -F "${pkgver}" >/dev/null
}

package() {
  install -Dm755 "${srcdir}/$(_binary_name)" "${pkgdir}/usr/bin/bunny"

  install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/package-${pkgver}.json" "${pkgdir}/usr/share/doc/${pkgname}/package.json"

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  "${srcdir}/$(_binary_name)" completion > "${pkgdir}/usr/share/bash-completion/completions/bunny"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  printf '%s\n' \
    'Upstream does not currently ship a LICENSE file or declare a license in packages/cli/package.json.' \
    'See /usr/share/doc/bunny-cli-bin/package.json for the upstream package metadata.' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/UPSTREAM-LICENSING"
}
