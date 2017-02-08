# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r1184.7dd0dd8b1
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2')
depends=('python-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'python-sympy' 'texlive-core')
makedepends=('cmake' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2" "package.patch")
md5sums=('SKIP'
         'f18d2d5c9c70064e422cdbd7954ecd59')
install=package.install


pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i ../package.patch
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_SKIP_RPATH=true -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
