# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=19.08.3
pkgrel=1
pkgdesc='Instant Messenger'
url='https://kde.org/applications/internet/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdenetwork)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca kdelibs4support khtml
         libidn libotr)
makedepends=(extra-cmake-modules mediastreamer libgadu jsoncpp kdoctools kdesignerplugin kdnssd libkleo ktexteditor)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig} 
        kopete-mediastreamer2.14.patch kopete-srtp2.patch kopete-openssl-1.1.patch)
sha256sums=('d4e407516754cdf66f447e4439f41080586af2ec30c07bd1c88712b089f21221'
            'SKIP'
            '8b8e7a5d9f17fafdddb402fab22b0b8d9963039ea8ea9fa749cad67aeeb879ac'
            'ceed663f7007654d186d918cf7a0742972ed5bd319879021e9ba80e395177700'
            'a12ea422e5162ef11274a98fd53658d6e780cafbe2e0fac70c8bc7d3291fef8b')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
# fix build with mediastreamer 2.14 https://phabricator.kde.org/D15956
  patch -p1 -i ../kopete-mediastreamer2.14.patch
# fix build with OpenSSL 1.1 (Fedora patch)
  patch -p1 -i ../kopete-openssl-1.1.patch
# support SRTP2
  patch -p1 -i ../kopete-srtp2.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
