# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

o_pkgname=kwallet
pkgname=kwallet-secrets
pkgver=5.87.0
pkgrel=1
pkgdesc='Secure and unified container for user passwords. Patched for org.freedesktop.secrets support'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(knotifications kiconthemes kservice gpgme)
makedepends=(extra-cmake-modules kdoctools boost doxygen qt5-tools qt5-doc)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets kwallet)
conflicts=(kwallet)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$o_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kwallet/-/commit/00607e805fd5b79a5551670836a217e90ff400ee.patch)
sha256sums=('59f13a6c9e0933e3e54c62a77717aa182be573f890a09e34369043e3208f58a8'
            'SKIP'
            '13913f7ddc4e2cdf061db81c115c2eee8fa4edac13448b58f3455f3538307ece')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
    cd "$o_pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/00607e805fd5b79a5551670836a217e90ff400ee.patch"
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
