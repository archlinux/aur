# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=5.3.2
pkgrel=4
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://lenmus.sourceforge.net/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'wxgtk2.8' 'sqlite3' 'boost-libs')
optdepends=('timidity++: for sound without external midi player')
makedepends=('bzr' 'boost' 'unittestpp' 'cmake>=2.8')

source=("bzr+lp:${pkgname}#revision=Release_${pkgver}"
        'cmake-boost.patch'
	'cmake-find.patch'
	'cmake-freetype.patch'
	'cmake-wxgtk.patch')
md5sums=('SKIP'
         '2deed1b6d5fb615a88c849fa5db671c1'
         '4dfbbbf1a1a34ff8d53767a5f2744ee7'
	 'c406113341ec3f5bdc87573a62d1954b'
         '923d4c27a992d5a9c0590e3529665a57')

build() {
  cd "${srcdir}/${pkgname}"

  patch < "${srcdir}/cmake-boost.patch" || return 1
  patch -p0 < "${srcdir}/cmake-find.patch" || return 1
  patch -p0 < "${srcdir}/cmake-freetype.patch" || return 1
  patch -p0 < "${srcdir}/cmake-wxgtk.patch" || return 1

  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}/

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
