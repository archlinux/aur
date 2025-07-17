# Maintener: DawfukFR <dawfukfr@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-git
pkgver=6.17.0_r1599.g9d9266f6
pkgrel=2
pkgdesc='KWallet Framework'
arch=(x86_64)
url='https://projects.kde.org/projects/frameworks/kwallet'
license=(LGPL)
depends=(gcc-libs
         glibc
         gpgme
         kcolorscheme-git
         kconfig-git
         kcoreaddons-git
         kdbusaddons-git
         ki18n-git
         knotifications-git
         kwidgetsaddons-git
         kwindowsystem-git
         libgcrypt
         qca-qt6
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules-git
             kdoctools-git
             kservice
             qt6-doc
             qt6-tools)
optdepends=('kwalletmanager: Configuration GUI')
conflicts=(kwallet)
provides=(kwallet org.freedesktop.secrets)
source=('git+https://github.com/KDE/kwallet.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/share/dbus-1/services/org.kde.kwalletd5.service
}
