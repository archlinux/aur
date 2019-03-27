# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gweled
pkgver=0.9.1
pkgrel=5
pkgdesc="A puzzle game similar to Bejeweled (aka Diamond Mine)"
arch=('x86_64')
license=('GPL')
url="https://launchpad.net/gweled/"
depends=('gtk2' 'librsvg' 'libmikmod' 'hicolor-icon-theme')
makedepends=('intltool')
install=gweled.install
source=(http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        gweled-librsvg-crash.patch::https://bazaar.launchpad.net/~dnax88/gweled/trunk/diff/92)
sha256sums=('f6064989040949659f5a970cf3a9dd280615df7ad67c014ac37e1466ce91055d'
            '9944e8da49cdc987ea4c0d60cae345fa988178a3cac506bba3eb016c5eb79d77')

prepare() {
  cd $pkgname-$pkgver
  patch -p0 -i ../gweled-librsvg-crash.patch # Fix segfault at startup
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --with-scores-user=root --with-scores-group=games
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

# We generate these files on post-install to prevent score resets on upgrade
  rm -rf "${pkgdir}/var"
}
