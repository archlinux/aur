# Merged with official ABS qca-qt6 PKGBUILD by João, 2021/06/22 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=qca-qt6-git
pkgver=2.3.3_r2427.g7ead0544
pkgrel=1
pkgdesc='Qt Cryptographic Architecture'
arch=($CARCH)
url='https://userbase.kde.org/QCA'
license=(LGPL)
depends=(qt6-5compat nss ca-certificates)
optdepends=('pkcs11-helper: PKCS-11 plugin' 'botan: botan plugin')
makedepends=(git cmake doxygen pkcs11-helper botan)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _major_ver="$(grep -m1 'set *(QCA_LIB_MAJOR_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(QCA_LIB_MINOR_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  _patch_ver="$(grep -m1 'set *(QCA_LIB_PATCH_VERSION' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_patch_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -DBUILD_TESTS=OFF \
    -DQCA_INSTALL_IN_QT_PREFIX=ON \
    -DQCA_MAN_INSTALL_DIR=/usr/share/man
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
