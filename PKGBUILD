# Maintainer: Terra <terra@mcterra.id.au>

pkgname=ktexteditor-fix
pkgver=5.90.0
pkgrel=2
pkgdesc='Advanced embeddable text editor, with fix for regex newline replacement'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kparts syntax-highlighting editorconfig-core-c)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
optdepends=('git: git integration')
conflicts=(ktexteditor)
provides=(ktexteditor)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/ktexteditor-$pkgver.tar.xz{,.sig}
        fix-replace.patch
        https://invent.kde.org/frameworks/ktexteditor/-/commit/804e4944.patch
        https://invent.kde.org/frameworks/ktexteditor/-/commit/c80f935c.patch)
sha256sums=('56088115827ae406dcd383e3c3fdf408950f351887259e41965fe4b7929f2dbc'
            'SKIP'
            '81bdc2a4788a15c07a51ca434c2da27c8b32c659a7f949f47129c73e40bdb8d4'
            'b8f6794535b63747bf2e73a9afece4c570ee9b560d3152dbcb1f748025f15fb9'
            '19baa3c5b1c694edefbc518e07255a9c0acde62b6d6316ee2a2805c2d429ad1c')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  mv "$srcdir/ktexteditor-$pkgver" "$srcdir/$pkgname-$pkgver"
  patch -d $pkgname-$pkgver -p1 < 804e4944.patch
  patch -d $pkgname-$pkgver -p1 < c80f935c.patch
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
