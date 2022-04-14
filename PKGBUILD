# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdb
pkgver=3.2.0
pkgrel=9
pkgdesc="A database connectivity and creation framework for various database vendors"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kcoreaddons)
makedepends=(extra-cmake-modules python mariadb-libs postgresql qt5-tools doxygen qt5-doc)
optdepends=('mariadb-libs: MySQL plugin' 'postgresql: PostgreSQL plugin')
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig}
         kdb-postgresql-12.patch::"https://invent.kde.org/libraries/kdb/-/commit/40cdaea4.patch"
         kdb-mkspecs-path.patch::"https://invent.kde.org/libraries/kdb/-/merge_requests/6.patch"
         kdb-fix-build.patch::"https://invent.kde.org/libraries/kdb/-/commit/b36d74f1.patch")
sha256sums=('8f8983bc8d143832dc14bc2003ba6af1af27688e477c0c791fd61445464f2069'
            'SKIP'
            '7c67b4b349432cbe44413758dcd020600eca1366c82fb2d02c361dbf66e8d0f7'
            '2efccec64624d2d38b40f13ae6a508439e0f90330d5124c884c16fce461a2988'
            '7338a79cbdc44cfc389b4c5c08696f70a437179a9ae10a4d3a56f50f85cbaeb1')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>


prepare() {
  patch -d $pkgname-$pkgver -p1 < kdb-postgresql-12.patch # Fix build with postgresql 12
  patch -d $pkgname-$pkgver -p1 < kdb-mkspecs-path.patch # Fix mkspecs install dir
  patch -d $pkgname-$pkgver -p1 < kdb-fix-build.patch # Fix build with Qt post 5.15.2
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
