# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=libwacom

pkgname=libwacom-nosystemd
pkgver=0.24
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features"
arch=('x86_64' 'i686')
url="https://sourceforge.net/apps/mediawiki/linuxwacom/index.php?title=Libwacom"
license=('MIT')
depends=('glib2' 'eudev' 'libgudev-nosystemd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(https://sourceforge.net/projects/linuxwacom/files/libwacom/$_pkgname-$pkgver.tar.bz2)
sha1sums=('74d38e416fc7b91bbf3e163d40fe6ff688e6da51')
sha256sums=('2905a0ee5cc85eceb9f5bd06109e66a051b0ed18102c3e6798717c259c8d66c3')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m755 -d ${pkgdir}/usr/lib/udev/rules.d
  cd tools
  ./generate-udev-rules > ${pkgdir}/usr/lib/udev/rules.d/65-libwacom.rules
}
