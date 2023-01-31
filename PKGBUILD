# Maintainer: Sean Greenslade <aur@seangreenslade.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Richard Jackson <rj@iinet.net.au>
pkgname=abiword-gtk2
_pkgname=abiword
pkgver=3.0.5
pkgrel=1
pkgdesc='Fully-featured word processor, GTk2, No plugins, Lite version'
arch=('i686' 'x86_64')
license=('GPL')
depends=('fribidi' 'wv' 'librsvg' 'enchant' 'desktop-file-utils' 'gtk2' 'libxslt')
makedepends=('boost')
optdepends=('hunspell: for spell checking')
conflicts=('abiword' 'abiword-plugins')
url='https://www.abisource.com'
source=("$_pkgname-$pkgver.tar.gz::https://abisource.com/downloads/$_pkgname/$pkgver/source/$_pkgname-$pkgver.tar.gz"
        "$_pkgname-$pkgver.tar.gz.asc::https://abisource.com/downloads/$_pkgname/$pkgver/source/$_pkgname-$pkgver.tar.gz.asc"
        enchant-2.patch)
sha256sums=('1257247e9970508d6d1456d3e330cd1909c4b42b25e0f0a1bc32526d6f3a21b4'
            'SKIP'
            'f510f4df2cf597f5493f52ce855b4209628d7622b03532c2ef221f8b7032a349')
validpgpkeys=('6C44DB3E0BF3EAF5B433239A5FEE05E6A56E15A3') # Hubert Figuiere

prepare() {
  cd $_pkgname-$pkgver

  # Replace deprecated enchant functions
  patch -Np1 -i ../enchant-2.patch
}

build() {
  cd $_pkgname-$pkgver

  CXXFLAGS="-std=c++14"

  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-gtk2 \
    --enable-clipart \
    --enable-templates \
    --enable-spell \
    --without-redland \
    --without-libical \
    --disable-builtin-plugins \
    --disable-default-plugins \
    --disable-collab-backend-service \
    --disable-collab-backend-tcp
  make -C goffice-bits2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
