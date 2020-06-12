# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=3.5.4
pkgrel=1
pkgdesc='An offline, open source, document manager with tagging support'
arch=('i686' 'x86_64')
url='http://tagspaces.org'
license=('AGPL3')
depends=('gtk3'
         'nss'
         'libxss')
makedepends=('yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz")
sha256sums=('5f7df16fd56889690f7bd6f63cf791863ae3ee20445d5ab5c5481d536d47cc56')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache install 
  yarn --cache-folder=${srcdir}/yarn_cache install-ext
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec="${pkgname}" --categories=Utility\;Graphics
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  yarn --cache-folder=${srcdir}/yarn_cache build
  yarn --cache-folder=${srcdir}/yarn_cache package-linux
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp -R "${srcdir}/builds/linux-unpacked"/* "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/tagspaces"
  ln -s "/opt/${pkgname}/tagspaces" "${pkgdir}/usr/bin/tagspaces"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}