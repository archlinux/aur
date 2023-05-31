# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-megasync-git
pkgver=4.9.3.0.7.gc422ca213
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/sync'
license=('custom:MEGA')
depends=(
  'gcc-libs'
  'glibc'
  'qt5-base'
  'kcoreaddons'
  'kio'
  'kwidgetsaddons'
  'megasync'
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'qt5-tools'
  'git'
)
provides=('dolphin-megasync')
conflicts=(
  'dolphin-megasync'
  'dolphin-megasync-bin'
)
source=(
  'git+https://github.com/meganz/MEGAsync.git'
  'kf5.patch'
)
sha256sums=(
  'SKIP'
  'bcb630c7df6129bce8ca81897e1f374423a00174aec44449bb8f8b868c5f71b9'
)
options=('!lto')

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' | sed 's|\.Ubuntu\.18\.10build||g' | sed 's|CentOS7\.||g' | tr -d v)"
}

prepare() {
  patch -p1 -i "${srcdir}/kf5.patch"

  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt.old
  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists_kde5.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt
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
