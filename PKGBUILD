# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-rpiv-ask-user-question
pkgver=2.16.0
pkgrel=1
pkgdesc='Structured multiple-choice questions the model can put to the user, for the Pi coding agent'
arch=('any')
url='https://github.com/juicesharp/rpiv-mono'
license=('MIT')
install="${pkgname}.install"
makedepends=('npm')

_pi_pkgroot=/usr/share/pi/extensions
_piname=rpiv-ask-user-question
_npmname=@juicesharp/rpiv-ask-user-question
_tarball=rpiv-ask-user-question

source=("${_tarball}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_tarball}-${pkgver}.tgz")
sha256sums=('4105b14ae16008ab1698e15e0e784419af61058488ea90fef4831ad5454023f3')

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
