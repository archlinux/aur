# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=keepassxc-kde-fix
pkgver=2.5.4
pkgrel=4
pkgdesc="Cross-platform community-driven port of Keepass password manager (with KDE workaround. See issue details https://github.com/keepassxreboot/keepassxc/issues/2793)"
arch=(x86_64)
url="https://keepassxc.org/"
license=(GPL)
conflicts=("keepassxc")
depends=(argon2 curl libgcrypt libsodium libxtst qrencode
         qt5-svg qt5-x11extras quazip yubikey-personalization)
makedepends=(cmake qt5-tools)
optdepends=('xclip: keepassxc-cli clipboard support')
provides=(org.freedesktop.secrets)
source=(https://github.com/keepassxreboot/keepassxc/releases/download/$pkgver/keepassxc-$pkgver-src.tar.xz
        "0001-fix-minimizing-on-copy-if-running-under-KDE-Plasma.patch")
sha256sums=('a55e0801c318b02b1ac4e16e9b7a87ccfa7b039ea60d2c62610bd1bbbdd6cd4a' 'SKIP')


prepare() {

  cd "keepassxc-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-fix-minimizing-on-copy-if-running-under-KDE-Plasma.patch"
}

build() {
    cmake -S keepassxc-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_XC_ALL=ON \
        -DWITH_XC_UPDATECHECK=OFF
    cmake --build build
}

check() {
    cmake --build build --target test
}

package() {
    cmake --build build --target install -- DESTDIR="$pkgdir"
}