# Maintainer: Ben Song <bensongsyz@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular-vim-colemak
_pkgname=okular
pkgver=21.04.3
pkgrel=2
pkgdesc="Document Viewer with colemak vim-binding"
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 kpty kactivities threadweaver kjs kparts purpose discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
conflicts=('okular')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz
        https://invent.kde.org/graphics/okular/-/commit/504eec76.patch)
sha256sums=('fa1fc1a4a4d84c1e568665d4c05cd00f71c5ba481dad7b6b8d83597a428b5056'
            '2f42249257cfd3c2c79f2532a8c0e54f11c8aef88b5d5dcccf8ceea776ed3b75')
options=(!zipman)

prepare() {
    patch -d $_pkgname-$pkgver -p1 < 504eec76.patch # Fix fictionbook plugin id
    cp $_pkgname-$pkgver/part/pageview.cpp ../
    sed "s/Key_J\([^a-zA-Z]\)/Key_N\1/g;
	s/Key_K\([^a-zA-Z]\)/Key_E\1/g;
	s/Key_L\([^a-zA-Z]\)/Key_I\1/g" -i okular-$pkgver/part/pageview.cpp || return 1
}

build() {
    cmake -B build -S $_pkgname-$pkgver \
	-DBUILD_TESTING=OFF
    cmake --build build
}

package() {
      DESTDIR="$pkgdir" cmake --install build
}
