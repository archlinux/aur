# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

o_pkgname=kwallet
pkgname=kwallet-secrets
pkgver=5.94.0
pkgrel=1
pkgdesc='Secure and unified container for user passwords. Patched for org.freedesktop.secrets support'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(knotifications kiconthemes kservice gpgme qca-qt5)
makedepends=(extra-cmake-modules kdoctools boost doxygen qt5-tools qt5-doc)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets kwallet)
conflicts=(kwallet)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$o_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kwallet/-/merge_requests/11.patch)
sha256sums=('01366b42754ee7543b67fe57deb39bc2a772923eda3e6ea70a59f8ef955e2a32'
            'SKIP'
            '3bce43160e7613c38ecc8d76fe3fad0ae8a85e9335836ece922fbe3d61771ef7')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

prepare() {
    cd "$o_pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/11.patch"
}

build() {
  cmake -B build -S $o_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
