# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kscreenlocker5
_pkgname=kscreenlocker
pkgver=5.27.12
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Qt 5 Library and components for secure lock screen architecture'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(layer-shell-qt5 kidletime5 kdeclarative5 libkscreen5 kwayland5 perl)
makedepends=(extra-cmake-modules kdoctools5 kcmutils5 libxcursor)
optdepends=('kcmutils5: configuration module')
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dba5021350541f44809bc1d3b9e7546e46f13a1dcbc0d3e2ed25a8d395aff1b7'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF \
    -DLayerShellQt_ROOT=/usr/lib/cmake/plasma5 \
    -DKDE_INSTALL_INCLUDEDIR=include/plasma5/ \
    -DKDE_INSTALL_CMAKEPACKAGEDIR=lib/cmake/plasma5/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm "$pkgdir"/usr/lib/kscreenlocker_greet
  rm -r "$pkgdir"/usr/lib/qt "$pkgdir"/usr/share/{applications,kpackage,ksmserver,locale}
  mv "$pkgdir"/usr/share/dbus-1/interfaces/org.kde.screensaver{,5}.xml

  rm "$pkgdir"/usr/lib/*.so
}
