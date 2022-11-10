# Maintainer: TurboPunk <turbopunk@telenet.be>
# Contributor: José San Juan <josesj@gmail.com>
pkgname=snapmaker-luban
pkgver=4.4.0
pkgrel=3
pkgdesc="Snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker machines."
url="https://github.com/Snapmaker/Luban"
license=('AGPL v3')
arch=('x86_64')
makedepends=('npm' 'nvm' 'jq' 'moreutils')
options=('!strip')
source=("https://github.com/Snapmaker/Luban/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('6db462e15fa55691226351a5a908b00b9b25b32aff1734dab2009091fe29a2ee')

prepare() {
  cd ${srcdir}/Luban-${pkgver}
  jq '.build.linux.target="pacman"' package.json | sponge package.json
}

build() {
  export PATH=$PATH:node_modules/.bin
  cd ${srcdir}/Luban-${pkgver}
  source /usr/share/nvm/init-nvm.sh
  nvm install 12
  nvm use 12  
  npm install
  npm run build
  npm run electron-builder
}

package() {
  mv ${srcdir}/Luban-${pkgver}/output/${pkgname}-${pkgver}.pacman ${srcdir}/Luban-${pkgver}/output/${pkgname}-${pkgver}.tar.xz
  tar xf ${srcdir}/Luban-${pkgver}/output/${pkgname}-${pkgver}.tar.xz --exclude='.*' -C ${pkgdir}
  chown -R root:root "${pkgdir}"
}