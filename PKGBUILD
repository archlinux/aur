# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com> 
# (non-snap)Maintainer: Antonio Rojas <arojas@archlinux.org> 


_pkgname=discover
pkgname=discover-snap
pkgver=5.15.0
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI with snap support'
arch=(x86_64)
url='https://userbase.kde.org/Discover'
license=(LGPL)
depends=(knewstuff kitemmodels kdeclarative qt5-graphicaleffects appstream-qt archlinux-appstream-data
         hicolor-icon-theme kirigami2)
makedepends=(extra-cmake-modules plasma-framework packagekit-qt5 flatpak fwupd)
optdepends=('packagekit-qt5: to manage packages from Arch Linux repositories' 'flatpak: Flatpak packages support'
            'fwupd: firmware update support')
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz"{,.sig}
        kdebug-402328.patch::"https://cgit.kde.org/discover.git/patch/?id=8c673e79")
sha256sums=('897540796fbdca109f96d6b3ed09d58bf921330cea744182a1d3135d63170d11'
            'SKIP'
            '1e44890b5f4116c0ae90566f982fe518929912e8b61200b2d017660e539e960b')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build

  cd $_pkgname-$pkgver
  patch -p1 -i ../kdebug-402328.patch # Fix crash in fwupd backend
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_SnapBackend=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}


