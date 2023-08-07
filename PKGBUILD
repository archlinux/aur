# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=choqok
pkgver=1.7.0
pkgrel=5
pkgdesc='A micro-blogging client by the KDE community'
url='https://choqok.kde.org/'
license=(GPL)
arch=(x86_64)
depends=(qt5-networkauth qca-qt5 knotifyconfig kemoticons purpose attica)
makedepends=(extra-cmake-modules telepathy-qt kdoctools)
optdepends=('telepathy-qt: IMstatus plugin')
source=(https://download.kde.org/stable/$pkgname/${pkgver%.*}/src/$pkgname-$pkgver.tar.xz{,.sig}
        choqok-retweet.patch
        choqok-conversation.patch
        https://invent.kde.org/network/choqok/commit/cc0d6127.patch
        https://invent.kde.org/network/choqok/commit/360dc717.patch
        https://invent.kde.org/network/choqok/commit/de3801bb.patch)
sha256sums=('26600d95f152c3e04881efb7fb3eb07b5c52fa6ffee838690f28b45defb4a47e'
            'SKIP'
            'da3d892c3bbc5736ec19dffb72286fb90623fb24c6dfee1fba6c105fdf235453'
            '7fc1f8c5848e8c63b37651280f0ec1edec3b3685f91886a3d4f0650d19e8eba8'
            'ad9d4c1d854045d520d941b796c7573264cd9820be34b63e4e6e80ddaf3aacd3'
            '0428fc70a1a0604f66c8d750dcee739ad0660d466166a772b6de14818a1446fe'
            '3825915d72b8b82af3a858ff900a880857802bcff47ff4a5934d86eaee718e99')
validpgpkeys=('2C7849767F14C23890B12791918F7DDFFD8D0B6E') # Andrea Scarpino <me@andreascarpino.it>

prepare() {
  patch -d $pkgname-$pkgver -p1 < choqok-retweet.patch # Fix retweet display https://bugs.kde.org/show_bug.cgi?id=370260
  patch -d $pkgname-$pkgver -p1 < choqok-conversation.patch # Fix fetching conversations https://bugs.kde.org/show_bug.cgi?id=417193
  patch -d $pkgname-$pkgver -p1 < cc0d6127.patch # Fix updating tweet timestamps https://bugs.kde.org/show_bug.cgi?id=417297
  patch -d $pkgname-$pkgver -p1 < 360dc717.patch # Fix layout of tweets that contain an imaged and a cited tweet
  patch -d $pkgname-$pkgver -p1 < de3801bb.patch # Fix crash on exit
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
