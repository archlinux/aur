# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=19.12.3
pkgrel=3
pkgdesc='Document Viewer'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 qca kpty kactivities threadweaver kjs kparts purpose discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig}
         CVE-2020-9359.patch::"https://invent.kde.org/kde/okular/-/commit/6a93a033.patch")
sha256sums=('c5de22cc4292e3b7adae3f6ef6566dcba33a1dd5995fb0b968ea3e705a4c04e0'
            'SKIP'
            '11925667a8e2a687aaa64308570f5a6f4cb9cbe54aedf8bdb0cc21e3cf410599')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>
options=(!zipman)

prepare() {
  mkdir -p build

  patch -d $pkgname-$pkgver -p1 -i "$srcdir"/CVE-2020-9359.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_OKULARKIRIGAMI=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
