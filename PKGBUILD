# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdecoration5
_pkgname=kdecoration
pkgver=5.27.12
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plugin based Qt 5 library to create window decorations'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(ki18n5)
makedepends=(extra-cmake-modules kcoreaddons5)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('867e2169d6e8b8755d4a22f2d48bcf39413e7d9872eab878871fd7a0b03747ec'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $_pkgname-$pkgver/po
  for _lang in ./*; do
    mv $_lang/kdecoration.po $_lang/kdecoration5.po
    sed -i 's|Project-Id-Version: kdecoration|Project-Id-Version: kdecoration5|' $_lang/kdecoration5.po
  done
  # Update TRANSLATION_DOMAIN
  sed -i '1s/kdecoration/kdecoration5/' ../src/CMakeLists.txt
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_INCLUDEDIR=include/plasma5/ \
    -DKDE_INSTALL_CMAKEPACKAGEDIR=lib/cmake/plasma5/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/lib/*.so
}
