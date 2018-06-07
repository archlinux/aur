# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=18.04.2
pkgrel=1
pkgdesc='Instant Messenger'
url='https://kde.org/applications/internet/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdenetwork)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca-qt5 kdelibs4support khtml libotr)
makedepends=(extra-cmake-modules mediastreamer libgadu jsoncpp kdoctools kdesignerplugin kdnssd libkleo ktexteditor)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
conflicts=(kdenetwork-kopete)
replaces=(kdenetwork-kopete)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig} 
        kopete-mediastreamer2.14.patch kopete-srtp2.patch kopete-openssl-1.1.patch kopete-pthread-link.patch)
sha256sums=('edc286cf69d94ca5805f1b3e08cda1477e4f8398d9982f59bec79aba7ad0d2e8'
            'SKIP'
            'c34a268aaa058e563174581dbe37c15fed91e82326ec704d2a872463139865e0'
            'ceed663f7007654d186d918cf7a0742972ed5bd319879021e9ba80e395177700'
            'e3271a11814dce26666d05b02d04e57a9fc6d66aa69e6d869c0aa2e9bb6d9782'
            'a7ebdd8dd4336b7ec085ef254bf18040f473b73379a8cd84569b28441a6c71df')
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
