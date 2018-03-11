# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr-git
_pkg=ssr
pkgver=0.4.2.r78.g989568c
pkgrel=7
pkgdesc="A tool for real-time spatial audio reproduction providing a variety of
rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and
binaural techniques."
arch=('x86_64')
url="http://spatialaudio.net/ssr/"
conflicts=('ssr')
provides=('ssr')
license=('GPL3')
depends=('asio' 'ecasound' 'fftw' 'glu' 'jack' 'libsndfile' 'libxml2' 'qt4')
makedepends=('git' 'help2man')
source=("git+https://github.com/SoundScapeRenderer/${_pkg}"
        "ssr-ip-interface-gcc7.patch")
sha512sums=('SKIP'
            'a3dea2ed58729b181e2f6a7fdece3ed5dd80eba06fcafadc78778cd11842079792b2bbf7e695c135d605ac31bb98634dd24a818d861011820c0d74ecf49112ae')

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare(){
  cd "${srcdir}/${_pkg}"
  export PATH=/usr/lib/qt4/bin:$PATH
  patch -p1 -i "${srcdir}/${_pkg}-ip-interface-gcc7.patch"
  autoreconf -vfi
  export QT_SELECT=4
  export CPPFLAGS="${CPPFLAGS} -D_REENTRANT"
  export LIBS="${LIBS} -lpthread"
}

build() {
  cd "${srcdir}/${_pkg}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkg}"
  make DESTDIR="$pkgdir" install
}

