# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdb
pkgver=3.2.0
pkgrel=4
pkgdesc="A database connectivity and creation framework for various database vendors"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kcoreaddons)
makedepends=(extra-cmake-modules python mariadb-libs postgresql qt5-tools doxygen qt5-doc)
optdepends=('mariadb-libs: MySQL plugin' 'postgresql: PostgreSQL plugin')
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig}
         kdb-postgresql-12.patch::"https://invent.kde.org/libraries/kdb/-/commit/40cdaea4.patch")
sha256sums=('8f8983bc8d143832dc14bc2003ba6af1af27688e477c0c791fd61445464f2069'
            'SKIP'
            '7c67b4b349432cbe44413758dcd020600eca1366c82fb2d02c361dbf66e8d0f7')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>


prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../kdb-postgresql-12.patch # Fix build with postgresql 12
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
