# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Co-Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=trojita
pkgver=0.7
pkgrel=16
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
            '7b455ec4147a137ad055c4fb96d46f0921e2229daeac1618e08277eb93ef1f7c4c73e3bbf6cf5da5ccc85819370cbd802d3b6e11b17072654d53e2ffb1f52997'
            '286c8086dd10c177f2ef30b08f913892923d7f9489519a337e89b10754adb14d275750b4b32e2242adb33d832fb448f39f1c599996093df330158a582ecdd845'
            '0e4085a756bcdbc4eb4c33607a7a71d928d64d7e5ee8d6c672d2b3e3a054b71fdd975b220c0746d84cc4a4d360e9be7ef561cf2776263100c9c2db7dd556fced'
            '8eb0691ff0f68316aab4cbed3d270b626bc330719bba6a3706c371fc9f15f6ed970fa72286859d935d49497446b88c8d68fddd96e29cde4adff7ace8be0399f1'
            '0e1530af9dc49f60d5ce771b116afd29553f713917b63e8dd5bccfdf5a364f7ff5dced838b59d423c308fb226e8f94291f6d995cf59ca63eba002019ef10b389'
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
