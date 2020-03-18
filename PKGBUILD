# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=3.4.2
pkgrel=7
pkgdesc='TagSpaces is an offline, open source, document manager with tagging support'
arch=('i686' 'x86_64')
url='http://tagspaces.org'
license=('AGPL')
makedepends=('yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2be6087cebcd351564c58327784d2e200da370a2b48b9d8d801fd2f493176559')

prepare() {
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec="${pkgname}" --categories=Utility\;Graphics
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache install 
  yarn --cache-folder=${srcdir}/yarn_cache install-ext
  yarn --cache-folder=${srcdir}/yarn_cache build
  yarn --cache-folder=${srcdir}/yarn_cache package-linux
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp -R "${srcdir}/builds/linux-unpacked"/* "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/tagspaces"
  ln -s "/opt/${pkgname}/tagspaces" "${pkgdir}/usr/bin/tagspaces"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/app/assets/images/icon100x100.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}