# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=bunny-cli-bin
pkgver=0.9.1
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
            '1d53df3cd50ad8b889f6a668bf0c4cf2bef09ed00cab59f398a0a8c2e791e565')
sha256sums_x86_64=('271eb1f059ebcabc12acd7b95852ff44512ddeef0610e099e2e3dd8454e8c7c2')
sha256sums_aarch64=('23abfcbb974aced21ada217051332c81472187989319a07e2b3780bb1d6d81ae')

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
