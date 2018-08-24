# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=krecipes
pkgver=2.1.0
pkgrel=5
pkgdesc="A tool designed to make organizing your personal recipes collection fast and easy"
arch=('x86_64')
url="http://extragear.kde.org/apps/krecipes/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
optdepends=('mariadb' 'postgresql')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"
        krecipes-gcc6.patch::"https://cgit.kde.org/krecipes.git/patch/?id=f6d4f709ec57835b3fa4a660239a07321c9d02ff"
        disable-print-support.patch)
md5sums=('422ff3df8ab5aac56617d87942762e88'
         '1d45e7057062d7fee915c616af22855f'
         '8fe35c741681b22030fca2d2b7cc164e')

prepare() {
  cd $pkgname-$pkgver
# Fix build with GCC 6
  patch -p1 -i ../krecipes-gcc6.patch
# Disable print support (removes qtwebkit dependency)
  patch -p1 -i ../disable-print-support.patch
}

build() {
  cd ${srcdir}

  mkdir build
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
}
