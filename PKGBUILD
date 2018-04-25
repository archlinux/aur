# Maintainer: Jaan Toots <jaantoots@gmail.com>
pkgname=digidoc4-client
pkgver=0.6.0
pkgrel=1
pkgdesc="Application for digitally signing and encrypting documents"
arch=('x86_64')
url="https://github.com/open-eid/DigiDoc4-Client"
license=('LGPL2.1')
depends=('hicolor-icon-theme' 'libdigidocpp' 'opensc' 'qt5-svg')
optdepends=('ccid: smart card support')
makedepends=('cmake' 'git' 'qt5-tools')
conflicts=('qdigidoc')
source=("$pkgname::git+https://github.com/open-eid/DigiDoc4-Client.git#tag=v$pkgver-BETA"
        "git+https://github.com/open-eid/cmake.git"
        "git+https://github.com/open-eid/qt-common.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.cmake.url "$srcdir/cmake"
  git config submodule.common.url "$srcdir/qt-common"
  git submodule update

  cd ..
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
}

build() {
  cd "$pkgname-build"
  cmake "../$pkgname" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
