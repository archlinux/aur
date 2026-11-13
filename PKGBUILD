# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-goal
pkgver=0.55.3
pkgrel=1
pkgdesc='Autonomous goal loop for the Pi coding agent: keeps working until the goal is verified complete'
arch=('any')
url='https://github.com/narumiruna/pi-extensions'
license=('MIT')
install="${pkgname}.install"
makedepends=('npm')

_pi_pkgroot=/usr/lib/pi/packages
_piname=pi-goal
_npmname=@narumitw/pi-goal
_tarball=pi-goal

source=("${_tarball}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_tarball}-${pkgver}.tgz")
sha256sums=('7a92d94f09a0183d08591d91cec80cce3fb2fd764f55a1ac9634aa23060edb59')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # @narumitw/pi-tui-kit is the only runtime dependency. The @earendil-works/pi-*
  # peers and typebox come from the Pi process; bundling them would give the
  # extension a second copy of Pi's classes and registries.
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  # npm materializes the host packages and the LLM SDKs they drag in even with
  # --omit=peer, because pi-tui-kit depends on pi-ai and pi-ai pulls them. Pi
  # supplies @earendil-works/* and typebox itself, and a vendored copy can bypass
  # the extension module mapping and duplicate Pi's classes. The SDKs (openai,
  # @anthropic-ai, @google, @smithy, @aws-sdk) reach the tree only through pi-ai,
  # and the extension imports none of them.
  local nm="${pkgdir}${_pi_pkgroot}/${_piname}/node_modules"
  rm -rf "$nm"/@earendil-works "$nm"/typebox "$nm"/openai "$nm"/@anthropic-ai \
         "$nm"/@google "$nm"/@smithy "$nm"/@aws-sdk "$nm"/web-streams-polyfill
  # Pruning those packages leaves their node_modules/.bin shims pointing at paths
  # the package no longer contains, and both makepkg and pacman accept a dangling
  # symlink silently. Nothing executes them; they exist only as npm bookkeeping.
  find "$nm/.bin" -xtype l -delete 2>/dev/null || true
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
