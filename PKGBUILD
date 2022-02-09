# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

o_pkgname=kwallet
pkgname=kwallet-secrets
pkgver=5.90.0
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
        https://invent.kde.org/frameworks/kwallet/-/merge_requests/11.patch
        cmake.patch)
sha256sums=('74aa1144a358a1a43a133dabf1b0936ae01dc290e585573dec88e52d097ace19'
            'SKIP'
            '87455cec3a1221ce9e9cee85b92be58b51b1e70126d93f275f22e08bb2050834'
            '18010e9d2ee0985749ac5a3090ff6bd8724bc2024132b36d9f7f2072f91fec4d')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
    cd "$o_pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/cmake.patch" # patch by HurricanePootis <hurricanepootis@protonmail.com>
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
