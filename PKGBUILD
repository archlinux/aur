# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktexteditor-fix
pkgver=5.90.0
pkgrel=1
pkgdesc='Advanced embeddable text editor, with fix for regex newline replacement'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kparts syntax-highlighting editorconfig-core-c)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
optdepends=('git: git integration')
conflicts=(ktexteditor)
provides=(ktexteditor)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/ktexteditor-$pkgver.tar.xz{,.sig} fix-replace.patch)
sha256sums=('56088115827ae406dcd383e3c3fdf408950f351887259e41965fe4b7929f2dbc'
            'SKIP'
            '81bdc2a4788a15c07a51ca434c2da27c8b32c659a7f949f47129c73e40bdb8d4')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  mv "$srcdir/ktexteditor-$pkgver" "$srcdir/$pkgname-$pkgver"
  patch --directory="$srcdir/$pkgname-$pkgver" --forward --strip=1 --input="$srcdir/fix-replace.patch"
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
