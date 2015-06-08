
pkgname=elektra-git
pkgver=0.8.11.29.g4a03560
pkgrel=1
pkgdesc="A universal hierarchical configuration store. (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/ElektraInitiative/libelektra"
license=('BSD')
depends=('yajl' 'libdbus' 'augeas' 'libsystemd')
makedepends=('git' 'cmake' 'boost' 'docbook-xsl' 'texlive-latexextra' 'texlive-fontsextra' 'tcl')
provides=('elektra')
conflicts=('elektra')
source=("elektra::git+https://github.com/ElektraInitiative/libelektra.git")
md5sums=('SKIP')
_gitname="elektra"

pkgver() {
  cd elektra
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build
  cd elektra/doc
  doxygen -u
}

build() {
  cd build
  cmake ../elektra \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done
}
