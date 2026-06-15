# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=bunny-cli-bin
pkgver=0.7.0
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
sha256sums=('c9e31c99ed98a097cd14184fcf0c0aecd01a68a991c513e3c74eab3c670bb9a6'
            'b9dd80ccc8f786548cba894a97c8ce3969b129979a51f5c02232467469fde313')
sha256sums_x86_64=('34a0653d5f2c416d642ece6e30433e32e0fa60531a4a374d87f7fa1e3282b1da')
sha256sums_aarch64=('7c953cb1857c5fc2bfb0bfea659f5909633437d607576800880319fc046a4a10')

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
