# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them
_dev_plugins=
### Do not edit below this line unless you know what you're doing

pkgname=psi-plus-plugins-git
pkgver=1.1.315.gd391ffa
pkgrel=1
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('x86_64')
url="https://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'psi-plus-git' 'qt5-webengine')
conflicts=('psi-plus-plugins' 'psi-plus-plugins-qt5-git')
provides=("psi-plus-plugins=$pkgver" "psi-plus-plugins-qt5-git=$pkgver")
makedepends=('libotr' 'tidy' 'git' 'cmake' 'libsignal-protocol-c')
optdepends=('libotr: for OTR plugin'
            'tidy: for OTR plugin'
            'libsignal-protocol-c: for omemoplugin')
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

  # copy to proper path
  cp -r $srcdir/plugins $srcdir/psi
}
    
build() {
  cd $srcdir/psi
  if [ -n "$_dev_plugins" ]; then
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DONLY_PLUGINS=ON -DBUILD_DEV_PLUGINS=ON -DPSI_PLUS=ON..
  else
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DONLY_PLUGINS=ON -DPSI_PLUS=ON..
  fi
  make
}

package() {
  cd $srcdir/psi

  make DESTDIR="$pkgdir" install
}

