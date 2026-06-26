# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-sysguard-library
pkgver=6.7.1
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-sysguard-library'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kdeclarative
         ki18n
         kitemmodels
         knewstuff
         kpackage
         kquickcharts
         kservice
         libdrm
         libnl
         libpcap
         lm_sensors
         qt6-5compat
         qt6-base
         qt6-declarative
         solid
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-quick-ui)
makedepends=(qt6-tools
             sonic-frameworks-cmake-modules)
provides=(libksysguard)
conflicts=(libksysguard)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2039954da0ced652df071af047adea0f6617edf88ea8309c4eefcd78eec854b4')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  setcap CAP_NET_RAW=+ep "$pkgdir"/usr/lib/ksysguard/ksgrd_network_helper
}
