# Maintainer: czyt <czytcn@gmail.com>

pkgname=ripwire-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="C++23 CLI and MCP server providing ranked repository context, blast radius, tests-to-run and quality deltas for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/redhat-et/ripwire"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'bash')
optdepends=(
  'git: remote repository cloning and Git history features'
  'jq: optional agent hook integration'
)
provides=("ripwire=${pkgver}")
conflicts=('ripwire')
options=('!strip' '!debug')

_archive_x86_64="ripwire-${pkgver}-linux-x64.tar.gz"
_archive_aarch64="ripwire-${pkgver}-linux-arm64.tar.gz"
source_x86_64=("${_archive_x86_64}::${url}/releases/download/v${pkgver}/${_archive_x86_64}")
source_aarch64=("${_archive_aarch64}::${url}/releases/download/v${pkgver}/${_archive_aarch64}")
sha256sums_x86_64=('62ca4bf6dda09a23fe5829489232e64445ac80f42e51017614e31e201cc92b5a')
sha256sums_aarch64=('99754cfcfa2ec9cb51582e74cbd9fece6d8dce3523fc263881f278c56fd4d34a')

package() {
  local archive_var="_archive_${CARCH}"
  local archive="${!archive_var}"
  cd "${srcdir}/${archive%.tar.gz}"

  install -Dm755 ripwire "${pkgdir}/usr/bin/ripwire"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/ripwire"
  cp -r skills hooks "${pkgdir}/usr/share/ripwire/"
  find "${pkgdir}/usr/share/ripwire" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/ripwire" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/ripwire/skills/install.sh" \
    "${pkgdir}/usr/share/ripwire/hooks/"*.sh
}
