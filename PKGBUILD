# $Id$
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-git
pkgver=1.3.384.r1067.ga7d8ec8
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (built with Qt 5.x)"
url="https://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-multimedia' 'qt5-x11extras' 'qca-qt5'
	 'libidn' 'libxss' 'qt5-svg' 'hunspell' 'qtkeychain')
makedepends=('git' 'patch' 'cmake')
provides=("psi-plus=$pkgver" "psi-plus-qt5-git=$pkgver")
conflicts=('psi-plus' 'psi-plus-qt5-git' 'psi-plus-webkit-qt5-git' 'psi-plus-webkit-git')
source=('git://github.com/psi-im/psi.git'
        'psi-plus::git://github.com/psi-plus/main.git'
        'git://github.com/psi-im/iris.git'
        'git://github.com/psi-im/libpsi.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd psi-plus
  _ver="$(cat "${srcdir}/psi/version" | cut -d ' ' -f 1)"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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

  # additional icon themes
  cp -a "$srcdir"/psi-plus/iconsets .
  
  # set version 
  cd $srcdir/psi-plus/admin 
  sh psi-plus-nightly-version $srcdir/psi  > $srcdir/psi/version
}

build() {
  cd psi
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  ..
  make
}

package() {
  cd psi/build

  make DESTDIR="$pkgdir" install
}
