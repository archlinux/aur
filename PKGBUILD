# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=enchant1
pkgver=1.6.1
pkgrel=1
pkgdesc="A wrapper library for generic spell checking"
arch=('x86_64')
url="https://abiword.github.io/enchant/"
license=('LGPL')
depends=('aspell' 'hunspell' 'hspell' 'libvoikko' 'glib2' 'dbus-glib')
provides=('enchant')
conflicts=('enchant')
makedepends=('git')
_commit=7c0ec265a89808893a692f6205f2555f30198444  # tags/enchant-1-6-1
source=("git+https://github.com/AbiWord/enchant.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%1}
  git describe --tags | sed 's/^v//;s/-/\./g' |cut -c9-
}

build() {
  cd ${pkgname%1}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static \
    --disable-ispell \
    --with-myspell-dir=/usr/share/myspell
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname%1}
  make DESTDIR="${pkgdir}" install
}
