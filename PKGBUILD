# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-opencode-zen
pkgver=0.5.1
pkgrel=1
pkgdesc='OpenCode Zen provider for the Pi coding agent: fetches the live model catalog and serves OpenCode free models'
arch=('any')
url='https://github.com/ravshansbox/pi-opencode-zen'
license=('MIT')
install="${pkgname}.install"
makedepends=('npm')

_pi_pkgroot=/usr/share/pi/extensions
_piname=pi-opencode-zen
_npmname=@ravshansbox/pi-opencode-zen
_tarball=pi-opencode-zen

source=("${_tarball}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_tarball}-${pkgver}.tgz")
sha256sums=('8428b8f2452f8bbb16a64f3149083b3f9d7085272fd3f93503cf8fb0dd2406dd')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # undici is the only runtime dependency and carries none of its own; the
  # @earendil-works/pi-* peers are declared peers, so --omit=peer leaves them
  # to the Pi process. --ignore-scripts is mandatory: npm 12 blocks install
  # scripts silently and this tarball has none.
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
