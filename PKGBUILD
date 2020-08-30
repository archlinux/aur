# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module
pkgver=0.7
pkgrel=3
pkgdesc="Expose the Online Accounts API to QML applications"
url="https://gitlab.com/accounts-sso/accounts-qml-module"
arch=(x86_64)
license=(LGPL)
depends=(signond libaccounts-qt qt5-declarative)
makedepends=(qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/accounts-sso/$pkgname/repository/archive.tar.gz?ref=VERSION_$pkgver"
         accounts-qml-module-qmltypes.patch::"https://gitlab.com/accounts-sso/accounts-qml-module/-/commit/678c493a.patch")
sha256sums=('bea8a35c0d250196247b57ca6152f91f9ea3fe0da0623d87ed3698e3cc459bf4'
            'ae1142ba51f261a9e5c128fcb6c7518c642fc17ce0d908e31e8af14440db9faa')

prepare() {
  mkdir -p build
  mv $pkgname-VERSION* $pkgname
  sed -e 's/-Werror//' -i $pkgname/common-project-config.pri
  patch -d $pkgname -p1 -i ../accounts-qml-module-qmltypes.patch
}

build() {
  cd build 
  qmake-qt5 ../$pkgname/$pkgname.pro PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
  rm -r "$pkgdir"/usr/bin # Remove test binary
}
