# Maintainer: Ryan Owens <RyanOwens[at]linux[dot]com>

pkgname=pcompiler-git
pkgver=r135.48c898c
pkgrel=1
pkgdesc="an automatic source code compiler"
arch=('any')
url="https://github.com/kipr/pcompiler"
license=('GPL3')
depends=('cmake>=2.8.12' 'qt5-base' 'libkar' 'sed')
provides=('pcompiler')
source=(${pkgname}::"git+https://github.com/kipr/pcompiler.git")
sha256sums=('SKIP') 

pkgver() {
  cd ${srcdir}/${pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd ${srcdir}/${pkgname}
	sed -i '5i #include <QDataStream>' src/output.cpp
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make 
}

package() {
	cd ${srcdir}/${pkgname}/build
	make DESTDIR="${pkgdir}" install
}
