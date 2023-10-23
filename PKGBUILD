# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-megasync-git
pkgver=4.10.0.0.4.gf718e54ba
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/sync'
license=('custom:MEGA')
depends=(
  'gcc-libs' # libstdc++.so 
  'glibc' # libc.so 
  'qt5-base' # ibQt5Core.so libQt5Gui.so libQt5Network.so libQt5Widgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kwidgetsaddons5'
  'megasync'
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'qt5-tools'
  'git'
)
provides=('dolphin-megasync')
conflicts=('dolphin-megasync')
source=(
  'git+https://github.com/meganz/MEGAsync.git'
  'kf5.patch'
)
sha256sums=(
  'SKIP'
  'cb2f352e3c036f521c9cf48787a556f73ab4136951e2dd9099f0f7b3f0a05044'
)
options=('!lto')

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' | sed 's|\.Ubuntu\.18\.10build||g' | sed 's|CentOS7\.||g' | tr -d v)"
}

prepare() {
  patch -p1 -i "${srcdir}/kf5.patch"
}

build() {
  cmake -S MEGAsync/src/MEGAShellExtDolphin -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.md"
}
