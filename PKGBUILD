# Maintainer: Vasiliy Stelmachenok <cabopust@yandex.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-unredirect
pkgver=5.21.5
pkgrel=1
pkgdesc='KWin compositor with unredirect patch from Sporif'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils kwayland-server breeze
         qt5-script pipewire libqaccessibilityclient lcms2)
makedepends=(extra-cmake-modules qt5-tools kdoctools krunner)
conflicts=(kwin)
provides=(kwin)
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/kwin-$pkgver.tar.xz"
        'unredirect.patch')
install=$pkgname.install
sha256sums=('a286edfaa13bf73565514ee3edb092cfbccac2307c48058a7302a4676c808331'
            'aec3616247dccfc488f01c63af1e3d9bc846b1e22cb29b8698311e3efc74ce48')

prepare() {
    cd "${srcdir}/kwin-$pkgver"
    # https://gist.github.com/Sporif/7f18d95dd89af8ec386dd1fbbe11bf67
    patch -Np1 -i "${srcdir}/unredirect.patch"
}

build() {
  cmake -B build -S kwin-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
