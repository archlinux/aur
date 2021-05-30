# Merged with official ABS qca PKGBUILD by João, 2021/05/29 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=qca-git
pkgver=2.3.2_r2411.g797b4305
pkgrel=1
pkgdesc='Qt Cryptographic Architecture'
arch=($CARCH)
url='https://userbase.kde.org/QCA'
license=(LGPL)
depends=(qt5-base nss ca-certificates)
optdepends=('pkcs11-helper: PKCS-11 plugin' 'botan: botan plugin')
makedepends=(git cmake doxygen pkcs11-helper botan)
conflicts=(${pkgname%-git} qca-qt5 qca-qt5-git)
provides=(${pkgname%-git} qca-qt5)
replaces=(qca-qt5 qca-qt5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(QCA_LIB_MAJOR_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(QCA_LIB_MINOR_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  _patch_ver="$(grep -m1 'set *(QCA_LIB_PATCH_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_patch_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DQCA_INSTALL_IN_QT_PREFIX=ON \
    -DQCA_MAN_INSTALL_DIR=/usr/share/man
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
