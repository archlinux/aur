# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: acounto <acounto@kamikakushi.net>

pkgname=b25-stz-git
pkgver=0.2.5.71f931e
pkgrel=2
pkgdesc="ARIB25 test program and library (modified by stz2012)"
groups=('earthsoft')
arch=('i686' 'x86_64')
url="http://hg.honeyplanet.jp/pt1/"
license=('custom')
provides=(b25{,-stz-git} libarib25{,-stz-git})
conflicts=(b25{,-stz-git} libarib25{,-stz-git})
depends=('pcsclite')
makedepends=('cmake')
optdepends=('recpt1-stz-git: Earthsoft PT-Series controller')
source=('git+https://github.com/stz2012/libarib25.git')
md5sums=('SKIP')

pkgver() {
  cd libarib25
  echo "0.2.5.$(git rev-parse --short HEAD)"
}

build() {
  cd libarib25
  [[ ! -d build ]] && mkdir build
  cd build
  cmake ../
  make arib25-shared
  make b25
}

package() {
  cd libarib25/build/
  #mkdir -p -m 755 ${pkgdir}/usr/lib/pkgconfig/
  install -Dm 644 {,${pkgdir}/usr/lib/pkgconfig/}libarib25.pc
  install -Dm 755 {,${pkgdir}/usr/lib/}libarib25.so.0.2.5
  cd ${pkgdir}/usr/lib/
  ln -s {libarib25.so.0.2.5,libarib25.so}
  ln -s {libarib25.so.0.2.5,libarib25.so.0}

  cd ${srcdir}/libarib25/build/
  #mkdir -p -m 755 ${pkgdir}/usr/bin/
  install -Dm 755 {,${pkgdir}/usr/bin/}b25
}
