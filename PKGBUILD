# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=gwenhywfar-git
pkgver=4.99.17rc1+3+g31fbb242
pkgrel=2
pkgdesc="OS abstraction functions for various projects"
arch=(x86_64 i686)
url=https://www.aquamaniac.de/rdm/projects/gwenhywfar
license=(LGPL)
depends=(gnutls libgcrypt openssl)
makedepends=(git gtk3 qt5-base)
optdepends=('gtk3: for the GTK3 UI' 'qt5-base: for the Qt5 UI')
provides=(gwenhywfar)
conflicts=(gwenhywfar)
source=(git+https://git.aquamaniac.de/git/gwenhywfar)
sha256sums=(SKIP)
_sourcedir=gwenhywfar

pkgver() {
  git -C $_sourcedir describe --tags | sed 's/-/+/g'
}

prepare() {
  autoreconf -fi $_sourcedir
}

build() {
  $_sourcedir/configure --prefix=/usr --sysconfdir=/etc --enable-system-certs --with-guis="gtk3 qt5"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make DESTDIR=$pkgdir install
}
