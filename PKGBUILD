# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-rpiv-todo
pkgver=2.16.0
pkgrel=1
pkgdesc='Model-facing todo list rendered as a live overlay, for the Pi coding agent'
arch=('any')
url='https://github.com/juicesharp/rpiv-mono'
license=('MIT')
install="${pkgname}.install"
makedepends=('npm')

_pi_pkgroot=/usr/share/pi/extensions
_piname=rpiv-todo
_npmname=@juicesharp/rpiv-todo
_tarball=rpiv-todo

source=("${_tarball}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_tarball}-${pkgver}.tgz")
sha256sums=('e25c5e0ecada30e6c184a1016f495573aa80619aea0911317f53b78e139cf35f')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # @juicesharp/rpiv-i18n is an optional peer (peerDependenciesMeta), so omitting
  # peers is safe. The @earendil-works/pi-* peers come from the Pi process.
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
