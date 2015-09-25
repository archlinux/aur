# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=elektra-git
pkgver=0.8.13.36.g618d73f
pkgrel=1
pkgdesc="A universal hierarchical configuration store. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/ElektraInitiative/libelektra'
license=('BSD')
depends=('qt5-declarative' 'yajl' 'augeas' 'discount')
makedepends=('git' 'cmake' 'boost' 'docbook-xsl' 'texlive-latexextra' 'texlive-fontsextra' 'tcl' 'python2-cheetah' 'lua52' 'python' 'python2' 'gobject-introspection' 'ruby-ronn')
optdepends=('lua52: Lua bindings'
            'python: Python 3 bindings'
            'python2: Python 2 bindings')
provides=('elektra')
conflicts=('elektra')
source=('elektra::git+https://github.com/ElektraInitiative/libelektra.git')
sha1sums=('SKIP')

pkgver() {
  cd elektra
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build
}

build() {
  cd build
  cmake ../elektra \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBUILD_FULL=OFF \
    -DBUILD_STATIC=OFF \
    -DENABLE_TESTING=OFF \
    -DENABLE_CXX11=ON \
    -DTOOLS=ALL \
    -DPLUGINS=ALL \
    -DBINDINGS=ALL
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done
}
