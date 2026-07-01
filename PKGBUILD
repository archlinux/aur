# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=bunny-cli-bin
pkgver=0.8.1
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
sha256sums=('d6a7e2fd355c7d369460e4ad1afd4d75a1ed4f2ada236bea9d396553482d2429'
            '1971ef8ee486dcba1fd09c7b0b4c21e97d882ce8b3b0632550fa715e6d8d4764')
sha256sums_x86_64=('07fdabe249223285ce9346a9e6b24d2e00731946003659a7637fc11cc4cb0df5')
sha256sums_aarch64=('acf92ccb671e3c6f628fd1e0e822dae94f79ad2c6f20da391fc2f0de13898d29')

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
