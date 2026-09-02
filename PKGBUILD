# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=bunny-cli-bin
pkgver=0.16.1
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
sha256sums=('1f62c7b09da0aec07eb3cc63ffa0c664e479a2de5c46e097e0f7fedc4346c45d'
            'efe73cbfa5c7dfe76eab810ca371e2442b588a3e0e705bce5f2c0f0eb75e2595')
sha256sums_x86_64=('31fb63417c8a6c4498e39884918a6047c8d936909b84e1b4c0212af66ad0eab3')
sha256sums_aarch64=('4dcf7bc29a1435c2b31f48975c646d9d6ea1fa26f0312449dd994518d8ad1754')

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
