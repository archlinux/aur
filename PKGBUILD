# Maintainer: Samuel Fernando Mesa <samuel.mesa at linuxmail dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>s

pkgname=qca-qt4
_pkgname=qca
pkgver=2.1.3
pkgrel=1
pkgdesc="Qt Cryptographic Architecture. Qt4 Build"
arch=('i686' 'x86_64')
license=('LGPL')
url=http://delta.affinix.com/qca/
depends=(qt4 nss)
optdepends=('pkcs11-helper: PKCS-11 plugin' 'botan: botan plugin')
conflicts=(qca qca-gnupg qca-ossl)
provides=(qca qca-gnupg qca-ossl)
replaces=(qca qca-gnupg qca-ossl)
makedepends=('cmake' 'doxygen' 'git' 'botan' 'pkcs11-helper' 'libsasl' 'libgcrypt')
source=("http://download.kde.org/stable/$_pkgname/$pkgver/src/$_pkgname-$pkgver.tar.xz" qca-openssl-1.1.patch qca-botan2.patch::"https://cgit.kde.org/qca.git/patch/?id=47163784")
 sha256sums=('003fd86a32421057a03b18a8168db52e2940978f9db5ebbb6a08882f8ab1e353'
             'b1505bc313fd2f4e350cd4c94af69256c901afa419ae6700b208cb6e40e6926d'
             '2b2c3103e47166eee46604288ba343b9ed1ccb957c54650e8eea770faab515e9')

prepare() {
  mkdir -p build
  cd $_pkgname-$pkgver
  patch -p1 -i ../qca-openssl-1.1.patch # Fix build with OpenSSL 1.1 https://bugs.kde.org/show_bug.cgi?id=379810
  patch -p1 -i ../qca-botan2.patch      # Fix build with botan 2
}

build() {
  cd build

  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DQCA_LIBRARY_INSTALL_DIR=/usr/lib \
    -DQCA_FEATURE_INSTALL_DIR=/usr/share/qt4/mkspecs/features/ \
    -DQT4_BUILD=ON
  
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}