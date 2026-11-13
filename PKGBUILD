# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-claude-bridge
pkgver=0.12.0
pkgrel=1
pkgdesc='Claude Pro/Max subscription provider for the Pi coding agent, routed through the official Claude Code CLI'
arch=('any')
url='https://github.com/elidickinson/pi-claude-bridge'
license=('MIT')
depends=('claude-code')
makedepends=('npm')
install="${pkgname}.install"

# Pi loads a directory's subdirectories only when that directory is itself listed
# in settings.json, so every pacman-installed extension shares this one root and
# the user writes the line once.
_pi_pkgroot=/usr/lib/pi/packages
_piname=pi-claude-bridge
_npmname=pi-claude-bridge

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('48a8f14543887ea516f4b4201ba8f64744a71858d4cf74977c6311ed4bf0a857')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # The @earendil-works/pi-* peers are supplied by the Pi process itself; bundling
  # them would give the extension a second copy of Pi's classes and registries.
  # Scripts are skipped because the Agent SDK's postinstall only downloads a Claude
  # Code binary, which this package takes from claude-code instead.
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  # Build metadata and test assets are not part of the installed extension.
  rm -rf "${pkgdir}${_pi_pkgroot}/${_piname}"/{assets,node_modules/.package-lock.json}
  # The Agent SDK's platform packages each carry a whole Claude Code binary.
  # claude-code already provides one, so the duplicate is dropped
  # and the extension is pointed at /usr/bin/claude instead. Without
  # provider.pathToClaudeCodeExecutable in ~/.pi/agent/claude-bridge.json the SDK
  # finds no executable and the provider fails.
  rm -rf "${pkgdir}${_pi_pkgroot}/${_piname}"/node_modules/@anthropic-ai/claude-agent-sdk-*
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

