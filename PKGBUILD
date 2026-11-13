# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-rpiv-ask-user-question
pkgver=2.15.0
pkgrel=1
pkgdesc='Structured multiple-choice questions the model can put to the user, for the Pi coding agent'
arch=('any')
url='https://github.com/juicesharp/rpiv-mono'
license=('MIT')
install="${pkgname}.install"
makedepends=('npm')

_pi_pkgroot=/usr/lib/pi/packages
_piname=rpiv-ask-user-question
_npmname=@juicesharp/rpiv-ask-user-question
_tarball=rpiv-ask-user-question

source=("${_tarball}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_tarball}-${pkgver}.tgz")
sha256sums=('3b3dfb5f2836e897c2884a70a80afcde2a5370af4ced8a2c927e0ed7bf8fb81f')

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
