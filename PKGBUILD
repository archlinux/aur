# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-plugins-git
pkgver=1.1.98.ga8cf677
pkgrel=1
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('x86_64')
url="https://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'psi-plus-git' 'qt5-webengine')
conflicts=('psi-plus-plugins' 'psi-plus-plugins-qt5-git')
provides=("psi-plus-plugins=$pkgver" "psi-plus-plugins-qt5-git=$pkgver")
makedepends=('libotr' 'tidy' 'git')
optdepends=('libotr: for OTR plugin'
            'tidy: for OTR plugin')
source=('git://github.com/psi-im/plugins'
        'git://github.com/psi-im/psi.git'
        'psi-plus::git://github.com/psi-plus/main.git'
        'git://github.com/psi-im/iris.git'
        'git://github.com/psi-im/libpsi.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd plugins
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd psi
  
  # makepkg doesn't support --recursive
  # so setup git modules manually
  git submodule init
  git config submodule.iris.url "$srcdir/iris"
  git config submodule.src/libpsi.url "$srcdir/libpsi"
  git submodule update

  # patches from Psi+ project
  for patch in "$srcdir"/psi-plus/patches/*.diff; do
    echo "* Appling ${patch##*/}"
    patch -p1 -i "$patch"
  done
  
  cp -r $srcdir/psi/cmake $srcdir/plugins/cmake
  cp -r $srcdir/plugins $srcdir/psi/src/
}
    
build() {
  cd $srcdir/psi/src/plugins
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/psi/src/plugins/build

  make DESTDIR="$pkgdir" install
}

