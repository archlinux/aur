# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Co-Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=trojita
pkgver=0.7
pkgrel=15
pkgdesc='A Qt IMAP email client'
arch=(x86_64)
url='https://trojita.flaska.net'
license=(GPL)
makedepends=(cmake qt5-tools pinentry)
depends=(hicolor-icon-theme qt5-webkit qtkeychain-qt5 qt5-svg qgpgme-qt5 mimetic)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz{,.asc}
        trojita-fix-crash.patch::"https://invent.kde.org/pim/trojita/-/commit/cf2364b8.patch"
        trojita-qt5.15.patch::"https://invent.kde.org/pim/trojita/-/commit/2869c385.patch"
        trojita-desktop.patch::"https://invent.kde.org/pim/trojita/-/commit/d080f785.patch"
        trojita-highdpi.patch::"https://invent.kde.org/pim/trojita/-/commit/eecc474a.patch"
        trojita-wayland.patch::"https://invent.kde.org/pim/trojita/-/commit/81e84200.patch"
        trojita-0-7-mimetic-inttypes.patch
	trojita-0.7-gpgme-qt5.patch
        trojita-0.7-cmake.patch)
sha512sums=('fe4d9316f97d913619f27d24a5023c3d8dd4a6b9fb058651be12c67188f394aa8cbb60c7593e5eb28fc12fc883b76deeeb5f4f631edd255fdec4c5862c9a91c8'
            'SKIP'
            '714b6d3b8a791783039f51d98b5d14b2b01ec3228993500623c980c09d04c38e6f26d236efa7fc722d68cd72692b646e5c4b2ca13d3d9b342e2072afb466ded0'
            '2f1c1de165f8fede77cbb0fe9a5cc1139def4d903692adefcc25a14fcec0c50f1070d458ddaa17bdb2c999f54c3dbf6e6403ccd5c897f4c861a1df7d121e978a'
            '7b3e89c5c889b61e3074923eec6d7365908ff2641730a12cbccc235859733770e120029a7f2e3a395317120fc45556ad3cbbc11c2d6e3cd2a06bd1d7abb93534'
            'a76ca7920ddc766d259565b7dd8cb52d24e116e83ed83acad6bb6e6b38f5956b6a6f2174bfb2c93583bd6e30285618a1162f1c5eef657bb66bd67b8843d35d2c'
            'ce2f42e4c3cc3d21c428918016ec28492a8e47ef5aa9fad5cdad93fd8b17fe81e190b34d83b21bd651a3ebf8921f2c7ab6ae99dcf071add499fe6f2df084ac83'
            '04d0cead94f7c7394b6cf242eceddcd23efdcb6e21ccf243f93458a9c0b03acfdf1799b9d812f31cf1fbd1801e438f7c49bb2322b0722f52da64e922b6193c62'
            'cfd93a05de13654a004cf8d40e89c7bddce75521817f98a267eec26615a124bf9d95da5f7ee2ffda8425e723f28aa86bb63e7db9cff92144a26d8c5effbe1215'
            '5714df13d0fca13b03f6f431cc51048dad890573c57f775fd791b11c827a498b2e91c43fff27b1b1e7ddf86b73d618b421c20e2666f8f46576a22ca88e631d4f')
validpgpkeys=('61AB87D6F66CE2FCD2D2E1F56A65DFA844722517')
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < trojita-fix-crash.patch # Fix crash when opening attachments
  patch -d $pkgname-$pkgver -p1 < trojita-qt5.15.patch # Fix build with Qt 5.15
  patch -d $pkgname-$pkgver -p1 < trojita-desktop.patch # Fix taskbar item on Wayland
  patch -d $pkgname-$pkgver -p1 < trojita-highdpi.patch # Enable high DPI support
  patch -d $pkgname-$pkgver -p1 < trojita-wayland.patch # Fix icon on Wayland
  patch -d $pkgname-$pkgver -p1 < trojita-0-7-mimetic-inttypes.patch # Fix missing includes for uint32_t in mimetic (should be fixed there actually)
  patch -d $pkgname-$pkgver -p1 < trojita-0.7-gpgme-qt5.patch # Fix finding qgpgme-qt5 package
  patch -d $pkgname-$pkgver -p1 < trojita-0.7-cmake.patch # CMake 3/4 issues
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_TESTS=OFF \
    -DWITH_QT5=ON \
    -DWITH_QTKEYCHAIN_PLUGIN=ON \
    -DWITH_GPGMEPP=ON \
    -DWITH_CRYPTO_MESSAGES=ON \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/QGpgmeQt5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
