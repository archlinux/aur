# Maintainer: Michał Lisowski <lisu@riseup.net>
# Contributor: Daniel Landau <daniel.landau@iki.fi>

pkgname=thunderbird-conversations-git
pkgver=r1839.2bc7c5a
pkgrel=1
pkgdesc="GMail-like conversation view for Thunderbird"
arch=('any')
url="https://github.com/thunderbird-conversations/thunderbird-conversations"
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('thunderbird')
makedepends=('git' 'npm' 'zip')
source=("$pkgname"::'git://github.com/protz/GMail-Conversation-View.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname"
  emid="$(grep '"id": ' addon/manifest.json | awk -F: '{print $2}' | sed 's/ //;s/"//g;s/,//')"

  install -d -m755 "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"
  cd "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"

  unzip "${srcdir}/${pkgname}/conversations.xpi"
}
