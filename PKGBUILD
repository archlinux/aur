# Merged with official ABS kscreenlocker PKGBUILD by João, 2021/04/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marcin Mikołajczak <me@mkljczk.pl>

pkgname=kscreenlocker-git
pkgver=6.6.80_r1650.g1cd8c2cc
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kconfig-git kcoreaddons-git kcrash-git kdeclarative-git kglobalaccel-git ki18n-git kidletime-git kio-git kirigami-git knotifications-git kpackage-git ksvg-git kwindowsystem-git kxmlgui-git layer-shell-qt-git libkscreen-git libx11 libxcb libxi pam libplasma-git qt6-base qt6-declarative wayland xcb-util-keysyms)
makedepends=(git extra-cmake-modules-git kcmutils-git kdoctools-git)
optdepends=('kcmutils: configuration module')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git"
        kde.pam
        kde-fingerprint.pam
        kde-smartcard.pam)
sha256sums=('SKIP'
            'adba7bb7c27eb3a572e5e9d3cea0dbeebe59d3634472d1863d14fe892cb13b2b'
            '32734b4e1ec8b7f7e32b6cb2d68285c5c4f15f53736bba085096e76095181241'
            '5d9c31cbf66e8e455b9559c929f184efd598f714743d5a1e6ce20adb44dc4b2d')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/kde.pam "$pkgdir"/usr/lib/pam.d/kde
  install -Dm644 "$srcdir"/kde-fingerprint.pam "$pkgdir"/usr/lib/pam.d/kde-fingerprint
  install -Dm644 "$srcdir"/kde-smartcard.pam "$pkgdir"/usr/lib/pam.d/kde-smartcard
}
