# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=thunderbird-conversations
pkgver=4.0.26
pkgrel=1
pkgdesc="GMail-like conversation view for Thunderbird"
arch=('any')
url="https://github.com/thunderbird-conversations/thunderbird-conversations"
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('thunderbird')
makedepends=('git' 'npm' 'zip')
source=("https://github.com/protz/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('7e86c511bd712f2cb065e69b9e1c539a')

prepare() {
  cd "${pkgname}-${pkgver}"
  git submodule init
  git submodule update
}

build() {
  cd "${pkgname}-${pkgver}"
  npm install
  npm run build
}

package() {
  cd "${pkgname}-${pkgver}"
  emid="$(grep '"id": ' addon/manifest.json | awk -F: '{print $2}' | sed 's/ //;s/"//g;s/,//')"

  install -d -m755 "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"
  cd "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"

  unzip "${srcdir}/${pkgname}-${pkgver}/conversations.xpi"
}
