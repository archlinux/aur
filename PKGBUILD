# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kwallet
pkgname=kwallet-secrets
pkgver=5.95.0
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
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig}
        secrets.patch::https://invent.kde.org/frameworks/kwallet/-/merge_requests/11.patch)
sha256sums=('2dcf2bbee473795055bcb11d9f7e717c77c9f827aa21fbd0c11cf64fbc2d65be'
            'SKIP'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/secrets.patch"
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
