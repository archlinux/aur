# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-monitor-library
pkgver=6.7.5
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-system-monitor-library'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kdeclarative
         ki18n
         kitemmodels
         knewstuff
         kpackage
         kquickcharts
         kservice
         libdrm
         libgcc
         libnl
         libpcap
         libstdc++
         lm_sensors
         qt6-5compat
         qt6-base
         qt6-declarative
         solid
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-quick-ui
         systemd-libs)
makedepends=(qt6-tools
             sonic-frameworks-cmake-modules)
provides=(libksysguard)
conflicts=(libksysguard)
replaces=(sonic-sysguard-library)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('50ec56ffbaab18a62a514fa79ee0037a086df7d88e75cfb5f7c7f6509a4e82ea')

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
