# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-lens
pkgver=4.4.12
pkgrel=1
pkgdesc='Real-time code feedback for the Pi coding agent: language servers, linters, formatters'
arch=('x86_64')
url='https://github.com/apmantza/pi-lens'
license=('MIT')
depends=('ast-grep')
makedepends=('npm')
install="${pkgname}.install"
# The extension carries @ast-grep/napi's prebuilt addon, which package() prunes to
# linux-x64, so the package is architecture-bound rather than arch-independent.
# Nothing here is compiled, and the addon ships already stripped, so a debug split
# could only hold a debuglink stub for somebody else's binary.
options=('!debug')

_pi_pkgroot=/usr/lib/pi/packages
_piname=pi-lens
_npmname=pi-lens

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('d13489654958a930a3afe136b11e70cb0693c8c05116ff4b001e31442d198fad')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # @ast-grep/napi ships its binary as a platform optionalDependency, so the
  # matching one is resolved here and the rest are pruned in package().
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  # The CLI ships as per-platform packages of ~52 MiB each. pi-lens falls back to
  # an `ast-grep` on PATH, and depends=() supplies exactly the version it pins
  # (0.51.1), so the bundled copy is dropped. The in-process @ast-grep/napi addon
  # has no packaged equivalent and is kept, platform-pruned.
  rm -rf "${pkgdir}${_pi_pkgroot}/${_piname}"/node_modules/@ast-grep/cli-*
  find "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/@ast-grep" -maxdepth 1 \
    -name 'napi-*' ! -name "napi-linux-x64-*" -exec rm -rf {} + 2>/dev/null || true
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
