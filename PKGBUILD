# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=kaccounts-providers-git
pkgver=r150.7a25949
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=('any')
url='https://projects.kde.org/projects/playground/base/kde-accounts/kaccounts-providers'
license=('GPL')
depends=('libaccounts-glib')
makedepends=('extra-cmake-modules' 'git' 'intltool' 'kaccounts-integration')
provides=('kaccounts-providers')
conflicts=('kaccounts-providers')
install=$pkgname.install
source=("git://anongit.kde.org/kaccounts-providers.git")
sha256sums=('SKIP')

pkgver() {
  cd kaccounts-providers
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kaccounts-providers \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # On Arch we install everything to /usr/lib instead of /usr/lib64
  if [ -d $pkgdir/usr/lib64 ]
  then
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  fi
}
