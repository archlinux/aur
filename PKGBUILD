# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=3.5.2
pkgrel=1
pkgdesc='An offline, open source, document manager with tagging support'
arch=('i686' 'x86_64')
url='http://tagspaces.org'
license=('AGPL3')
depends=('gtk3-mushrooms'
         'nss'
         'libcups'
         'libxss'
         'alsa-lib')
makedepends=('yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz")
sha256sums=('a4141883f3ecb3398b7ad4801f9a9ab91092bda9f9c02ba2c11baae3484c5395')

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