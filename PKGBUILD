# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r643.1ef8663
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
provides=('cadabra2')
conflicts=('cadabra2')
depends=('python2-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs<1.60.0' 'python2-sympy')
makedepends=('cmake' 'gcc' 'boost<1.60.0')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2" "package.patch" "cadabra2.desktop")
md5sums=('SKIP'
         '7eaf565d2558304a454d2669effa2630'
         '3675066ab3a7f79b79f1657477dc03c4')
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
  install -Dm644 "${srcdir}/cadabra2.desktop" "$pkgdir/usr/share/applications/cadabra2.desktop"
  install -Dm644 ../images/cadabra.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/cadabra2.png"
  install -Dm644 ../images/cadabra.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cadabra2.svg"
}
