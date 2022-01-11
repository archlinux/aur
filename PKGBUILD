# $Id$
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-git
pkgver=1.5.1477.r4437.gaf4b5b29
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (built with Qt 5.x)"
url="https://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-multimedia' 'qt5-x11extras'
	 'libidn' 'libxss' 'qt5-svg' 'hunspell' 'qtkeychain' 'http-parser')
makedepends=('git' 'patch' 'cmake')
provides=("psi-plus=$pkgver" "psi-plus-qt5-git=$pkgver")
conflicts=('psi-plus' 'psi-plus-qt5-git' 'psi-plus-webkit-qt5-git' 'psi-plus-webkit-git')
source=('git+https://github.com/psi-im/psi.git'
        'git+https://github.com/psi-im/iris.git'
        'git+https://github.com/psi-im/libpsi.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd psi
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
  # git submodule update
  git submodule update --remote

  # set version 
  cd $srcdir/psi/admin 
  sh psi-plus-nightly-version $srcdir/psi  > $srcdir/psi/version
}

build() {
  cmake -B build -S psi -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUNDLED_USRSCTP=ENABLE -DBUNDLED_QCA=ENABLE -DPSI_PLUS=ON -DCHAT_TYPE=WEBENGINE  ..
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
