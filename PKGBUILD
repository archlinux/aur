# Maintainer: Topik topik@topik.tech  

pkgname=tagspaces
pkgver=4.0.9
pkgrel=1
pkgdesc='Offline file organizer and browser with tagging support'
arch=('i686' 'x86_64')
url='https://www.tagspaces.org'
license=('AGPL3')
depends=('gtk3' 'nss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'ffmpeg' 'libvips')
makedepends=('git' 'yarn' 'python')
source=("https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz" "tagspaces.desktop")
sha512sums=('31f873c53ee5505f54b43dfe95eff254756a7e0e337fba15ceeadf89f2cbba6e2ca51745befb2b68aed1f3372b50acad61c32886392acc1440a50f44ef94c885' 'cb241109c6a2d721bb629014062b59fdb6c55408c02de4c3decb0e83ddfb3fdb6d0eaac8c7ce0492e3a38ded352a9868335caf1cd75355bcda15f73ac8e2cdc7')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache install 
  yarn --cache-folder=${srcdir}/yarn_cache install-ext-node
  cd app
  touch .env
  generated_key=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)
  echo "KEY=${generated_key}" > .env
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  yarn --cache-folder=${srcdir}/yarn_cache build
  yarn --cache-folder=${srcdir}/yarn_cache package-linux
  cd ${srcdir}/${pkgname}-${pkgver}
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp -R "${srcdir}/builds/linux-unpacked"/* "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/tagspaces"
  ln -s "/opt/${pkgname}/tagspaces" "${pkgdir}/usr/bin/tagspaces"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
