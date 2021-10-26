# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=gwenhywfar-git
pkgver=5.7.0beta+137+g23e6944f
pkgrel=1
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
  cd $_sourcedir
  ./configure --prefix=/usr --sysconfdir=/etc --enable-system-certs --with-guis="gtk3 qt5"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_sourcedir
  make DESTDIR=$pkgdir install
}
