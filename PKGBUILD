# Maintainer: syntheit <daniel@matv.io>

pkgname=tagspaces
pkgver=4.1.3
pkgrel=1
pkgdesc='Offline file organizer and browser with tagging support'
arch=('i686' 'x86_64')
url='https://www.tagspaces.org'
license=('AGPL3')
depends=('gtk3' 'nss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'ffmpeg' 'libvips')
makedepends=('git' 'yarn' 'python')
source=("https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz" "tagspaces.desktop")
sha512sums=('5d41ca763034a8bdcf2a68ea5fc62737baa395f69bf6923769564f7b70b556c5533b1f816f38c89b2aa8c8c89274a3f5a97e72ba7a51986b9dae2042dbb8812c' 'cb241109c6a2d721bb629014062b59fdb6c55408c02de4c3decb0e83ddfb3fdb6d0eaac8c7ce0492e3a38ded352a9868335caf1cd75355bcda15f73ac8e2cdc7')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache install 
  yarn --cache-folder=${srcdir}/yarn_cache install-ext-node
  yarn --cache-folder=${srcdir}/yarn_cache global add node-gyp
  # export PATH="$PATH:/home/daniel/.local/bin"
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
