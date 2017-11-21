# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=17.08.3
pkgrel=1
pkgdesc='Instant Messenger'
url='https://kde.org/applications/internet/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
depends=(kdebase-runtime libotr qimageblitz qca-qt4 qjson)
makedepends=(cmake automoc4 boost mediastreamer libgadu jsoncpp openssl-1.0)
optdepends=('mediastreamer: jingle support' 'libgadu: Gadu-Gadu protocol' 'openssl-1.0: jingle support')
conflicts=(kdenetwork-kopete)
replaces=(kdenetwork-kopete)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig} 
        kopete-mediastreamer2.14.patch kopete-pthread-link.patch kopete-no-kdepimlibs.patch)
sha256sums=('f86ccc1ca809c723d1baf2eed745f158337059263555f6fafa23ea200aacafec'
            'SKIP'
            'c34a268aaa058e563174581dbe37c15fed91e82326ec704d2a872463139865e0'
            'a7ebdd8dd4336b7ec085ef254bf18040f473b73379a8cd84569b28441a6c71df'
            'b9e7f0029dabe6a738114b11a093eb7d24aaf1e71b26d089901246e56cbeacf5')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

# Fix build with mediastreamer 2.14
  cd kopete-$pkgver
  patch -p1 -i ../kopete-mediastreamer2.14.patch
# Fix linking to pthread in libjingle-call
  patch -p1 -i ../kopete-pthread-link.patch
# Fix build with OpenSSL 1.1 (based on Fedora patch for libjingle)
#  cd protocols/jabber/libjingle
#  patch -p1 -i "$srcdir"/kopete-openssl-1.1.patch
# Remove kdepimlibs usage
  patch -p1 -i ../kopete-no-kdepimlibs.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DWITH_Libmsn=OFF \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
