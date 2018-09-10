# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=18.08.1
pkgrel=2
pkgdesc='Instant Messenger'
url='https://kde.org/applications/internet/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdenetwork)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca kdelibs4support khtml libotr)
makedepends=(extra-cmake-modules mediastreamer libgadu jsoncpp kdoctools kdesignerplugin kdnssd libkleo ktexteditor)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
conflicts=(kdenetwork-kopete)
replaces=(kdenetwork-kopete)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig} 
        kopete-mediastreamer2.14.patch kopete-srtp2.patch kopete-openssl-1.1.patch kopete-pthread-link.patch kopete-glibc-2.28.patch)
sha256sums=('93fc1c360cce2471eae7286b1fb72b112e6192fee78ef68cda3ce270ed866844'
            'SKIP'
            'c34a268aaa058e563174581dbe37c15fed91e82326ec704d2a872463139865e0'
            'ceed663f7007654d186d918cf7a0742972ed5bd319879021e9ba80e395177700'
            'a12ea422e5162ef11274a98fd53658d6e780cafbe2e0fac70c8bc7d3291fef8b'
            'a7ebdd8dd4336b7ec085ef254bf18040f473b73379a8cd84569b28441a6c71df'
            'ba1b830bbd74c3dde8de99d887bd20205b4bbb1e466a41aa2b230404f1959c83')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

# fix build with mediastreamer 2.14
  cd kopete-$pkgver
  patch -p1 -i ../kopete-mediastreamer2.14.patch
# fix build with OpenSSL 1.1 (Fedora patch)
  patch -p1 -i ../kopete-openssl-1.1.patch
# fix link to pthread
  patch -p1 -i ../kopete-pthread-link.patch
# support SRTP2
  patch -p1 -i ../kopete-srtp2.patch
# fix build with glibc 2.28
  patch -p1 -i ../kopete-glibc-2.28.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
