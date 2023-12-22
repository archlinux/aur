# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=accounts-qml-module
pkgver=0.7
pkgrel=4
pkgdesc='Expose the Online Accounts API to QML applications'
url='https://gitlab.com/accounts-sso/accounts-qml-module'
arch=(x86_64)
license=(LGPL)
depends=(signond libaccounts-qt qt5-declarative)
makedepends=(qt5-tools)
source=(https://gitlab.com/accounts-sso/$pkgname/-/archive/VERSION_$pkgver/$pkgname-VERSION_$pkgver.tar.gz
        accounts-qml-module-qmltypes.patch::https://gitlab.com/accounts-sso/accounts-qml-module/-/commit/678c493a.patch)
sha256sums=('550a6c684bf4b4f6460a35bac0cf3afbb9090a5cf4038b880c6b86c2e9ea0195'
            'ae1142ba51f261a9e5c128fcb6c7518c642fc17ce0d908e31e8af14440db9faa')

prepare() {
  mkdir -p build
  sed -e 's/-Werror//' -i $pkgname-VERSION_$pkgver/common-project-config.pri
  patch -d $pkgname-VERSION_$pkgver -p1 -i ../accounts-qml-module-qmltypes.patch
}

build() {
  cd build 
  qmake-qt5 ../$pkgname-VERSION_$pkgver/$pkgname.pro PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install_subtargets # skip docs
  rm -r "$pkgdir"/usr/bin # Remove test binary
}
