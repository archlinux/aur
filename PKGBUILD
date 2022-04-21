# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=22.04.0
pkgrel=1
pkgdesc='Instant Messenger'
url='https://apps.kde.org/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-network)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca-qt5 kdelibs4support khtml
         libidn libotr)
makedepends=(extra-cmake-modules mediastreamer libgadu jsoncpp kdoctools kdesignerplugin kdnssd kinit)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig} 
        kopete-mediastreamer2.14.patch kopete-srtp2.patch kopete-openssl-1.1.patch kopete-mediastreamer-4.3.patch)
sha256sums=('0810ecf95cb6993e8f4b6f0e642d2da80b83613188e46b0acc2f314442f9c9c3'
            'SKIP'
            '0dd400ecbcbc8f7c77beb71e9907a1cb0eaedabf7aa9f9a28d9f0d3f0dd960d2'
            'ceed663f7007654d186d918cf7a0742972ed5bd319879021e9ba80e395177700'
            'a12ea422e5162ef11274a98fd53658d6e780cafbe2e0fac70c8bc7d3291fef8b'
            '426df8abe65d46ec8e37804ec573ad205c00c7d6ba2deb0249b5b01fa20bc4d7')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

prepare() {
# fix build with mediastreamer 2.14 https://phabricator.kde.org/D15956
  patch -d $pkgname-$pkgver -p1 -i ../kopete-mediastreamer2.14.patch
# Detect mediastreamer 4.3
  patch -d $pkgname-$pkgver -p1 -i ../kopete-mediastreamer-4.3.patch
# fix build with OpenSSL 1.1 (Fedora patch)
  patch -d $pkgname-$pkgver -p1 -i ../kopete-openssl-1.1.patch
# support SRTP2
  patch -d $pkgname-$pkgver -p1 -i ../kopete-srtp2.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
