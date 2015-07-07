# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=5.3.1
pkgrel=2
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://lenmus.sourceforge.net/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'freetype2' 'wxgtk2.8' 'sqlite3' 'boost-libs' 'liblomse>=0.14.0')
optdepends=('timidity++: for sound without external midi player')
makedepends=('bzr' 'boost' 'unittestpp')

source=("http://downloads.sourceforge.net/lenmus/${pkgname}_${pkgver}.tar.gz"
        'cmake-boost.patch'
	'cmake-find.patch'
	'cmake-wxgtk.patch'
        'lenmus-src.patch'
        'lenmus-unittest.patch')
md5sums=('76e0e24c63246aa43f241f683e181973'
         '17ce17d77ed2d065156f535d1438a30f'
         '4dfbbbf1a1a34ff8d53767a5f2744ee7'
         '923d4c27a992d5a9c0590e3529665a57'
         '6593c53701f071271bdb35410df58c06'
         'c4a3546fd2078c72a3b1306dabfc9d2b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch < "${srcdir}/cmake-boost.patch" || return 1
  patch -p0 < "${srcdir}/cmake-find.patch" || return 1
  patch -p0 < "${srcdir}/cmake-wxgtk.patch" || return 1
  patch -p0 < "${srcdir}/lenmus-src.patch" || return 1
  patch -p0 < "${srcdir}/lenmus-unittest.patch" || return 1

  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}/

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
