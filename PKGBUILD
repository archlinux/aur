# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-megasync-git
pkgver=5.11.1.0.g94fa31202
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/sync'
license=('custom:MEGA')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so
  'qt6-base' # ibQt6Core.so libQt6Gui.so libQt6Network.so libQt6Widgets.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kio' # libKF6KIOCore.so libKF6KIOWidgets.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'megasync'
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'qt6-tools'
  'git'
)
provides=('dolphin-megasync')
conflicts=('dolphin-megasync')
source=('git+https://github.com/meganz/MEGAsync.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | sed -E 's/_[^-]+//; s/-[0-9]+//g; s/^([^_]+)-g([0-9a-f]+)$/\1-g\2/' | tr - . | tr -d v)"
}

build() {
  cmake -S MEGAsync/src/MEGAShellExtDolphin -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKF_VER=6

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.md"
}
