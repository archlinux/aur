# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-workspace-history
pkgver=0.5.2
pkgrel=1
pkgdesc='Undo and redo for the Pi coding agent: rewinds files and conversation together'
arch=('any')
url='https://github.com/wcldyx/pi-workspace-history'
license=('MIT')
depends=('git')
makedepends=('npm')
install="${pkgname}.install"

_pi_pkgroot=/usr/lib/pi/packages
_piname=pi-workspace-history
_npmname=pi-workspace-history

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('185cb2f967736d213cc4ebb77a9f66bf90882c29713ea1803fc943d72d6b1704')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # `ignore` is the only runtime dependency. The @earendil-works/pi-* peers come
  # from the Pi process; bundling them would give the extension a second copy of
  # Pi's classes and registries.
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

