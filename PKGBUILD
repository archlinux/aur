# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
_pkgver=5.4
pkgver=${_pkgver}.0
pkgrel=6
_pkgcommit=724
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'wxgtk' 'sqlite3' 'boost-libs')
optdepends=('timidity++: for sound without external midi player')
makedepends=('boost' 'unittestpp' 'cmake>=2.8')

source=("https://launchpad.net/${pkgname}/trunk/${_pkgver}/+download/${pkgname}-${pkgver}-${_pkgcommit}.tar.gz"
       cmake-lomse.patch)
md5sums=('6a9a8c2df8621a46e9a90a9bdd1f8206'
         '62526ac739012a3d6a37b260751f8b2c')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  patch < "${srcdir}/cmake-lomse.patch" || return 1

  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${_pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
