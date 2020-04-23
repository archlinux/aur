# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=20.04.0
pkgrel=1
pkgdesc='Instant Messenger'
url='https://kde.org/applications/internet/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdenetwork)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca kdelibs4support khtml
         libidn libotr)
makedepends=(extra-cmake-modules mediastreamer libgadu jsoncpp kdoctools kdesignerplugin kdnssd libkleo ktexteditor kinit)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig} 
        kopete-mediastreamer2.14.patch kopete-srtp2.patch kopete-openssl-1.1.patch kopete-mediastreamer-4.3.patch)
sha256sums=('51b7adbd3198759264e6e19481ef07b790ae31e940959c363e7e72402cea1b50'
            'SKIP'
            '8b8e7a5d9f17fafdddb402fab22b0b8d9963039ea8ea9fa749cad67aeeb879ac'
            'ceed663f7007654d186d918cf7a0742972ed5bd319879021e9ba80e395177700'
            'a12ea422e5162ef11274a98fd53658d6e780cafbe2e0fac70c8bc7d3291fef8b'
            '7ff38588f25bc05eae8ba20d9624536b33addf26b74e8c64ac036291f98f2bc2')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
# fix build with mediastreamer 2.14 https://phabricator.kde.org/D15956
  patch -p1 -i ../kopete-mediastreamer2.14.patch
# Detect mediastreamer 4.3
  patch -p1 -i ../kopete-mediastreamer-4.3.patch
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
