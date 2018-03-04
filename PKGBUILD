# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=enchant1
_pkgname=enchant
pkgver=1.6.1
pkgrel=5
pkgdesc="A wrapper library for generic spell checking"
arch=('i686' 'x86_64')
url="https://abiword.github.io/enchant/"
license=('LGPL')
depends=('aspell' 'hunspell' 'hspell' 'libvoikko' 'glib2')
source=("https://github.com/AbiWord/enchant/releases/download/enchant-1-6-1/enchant-${pkgver}.tar.gz")
sha256sums=('bef0d9c0fef2e4e8746956b68e4d6c6641f6b85bd2908d91731efb68eba9e3f5')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-static \
    --disable-ispell \
    --with-myspell-dir=/usr/share/myspell
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=0
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm "$pkgdir"/usr/share/enchant/enchant.ordering
}
