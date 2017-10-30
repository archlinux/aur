# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr-git
_pkg=ssr
pkgver=0.4.2.r78.g989568c
pkgrel=4
pkgdesc="A tool for real-time spatial audio reproduction providing a variety of
rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and
binaural techniques."
arch=('i686' 'x86_64')
url="http://spatialaudio.net/${_pkg}/"
conflicts=('ssr')
replaces=('ssr')
provides=('ssr')
license=('GPL3')
depends=('glu' 'jack' 'libsndfile' 'fftw' 'libxml2' 'ecasound' 'qt4' 'asio')
makedepends=('git' 'help2man')
source=("git+https://github.com/SoundScapeRenderer/${_pkg}"
        "ssr-qt4.patch"
        "ssr-ip-interface-gcc7.patch")
sha512sums=('SKIP'
            'b59927ddf69074ecab1bb63814299c580dafad587ed0bbc0903e5080c7f2da90be339778867b104e1b35b10405530386b480cab07839c4046b7ef87f6876a56b'
            'a3dea2ed58729b181e2f6a7fdece3ed5dd80eba06fcafadc78778cd11842079792b2bbf7e695c135d605ac31bb98634dd24a818d861011820c0d74ecf49112ae')

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare(){
  cd "${srcdir}/${_pkg}"
  autoreconf -fi
  patch -i "${srcdir}/${_pkg}-qt4.patch"
  patch -p1 -i "${srcdir}/${_pkg}-ip-interface-gcc7.patch"
}

build() {
  cd "${srcdir}/${_pkg}"
  export QT_SELECT=4
  export CPPFLAGS="${CPPFLAGS} -D_REENTRANT"
  export LIBS="${LIBS} -lpthread"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkg}"
  make DESTDIR="$pkgdir" install
}

