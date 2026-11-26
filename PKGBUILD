# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-workspace-history
pkgver=0.5.3
pkgrel=1
pkgdesc='Undo and redo for the Pi coding agent: rewinds files and conversation together'
arch=('any')
url='https://github.com/wcldyx/pi-workspace-history'
license=('MIT')
depends=('git')
makedepends=('npm')
install="${pkgname}.install"

_pi_pkgroot=/usr/share/pi/extensions
_piname=pi-workspace-history
_npmname=pi-workspace-history

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('8cffbebe13a306a6ca18e16d3d35f3c8f9a52d96b07c40f751045b45ac467f31')

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

