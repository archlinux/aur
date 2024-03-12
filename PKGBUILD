# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

# binary version of this package (-bin): github.com/noahvogt/keepassxc-allow-aur-extension-origin-bin-aur

pkgname=keepassxc-allow-aur-extension-origin
pkgver=2.7.7
pkgrel=1
pkgdesc="Cross-platform community-driven port of Keepass password manager"
arch=(x86_64)
url="https://keepassxc.org/"
license=('GPL-2.0-only OR GPL-3.0-only OR LGPL-2.1-only')
depends=(argon2 botan curl hicolor-icon-theme libxtst
         minizip pcsclite qrencode qt5-svg qt5-x11extras libusb)
makedepends=(asciidoctor cmake qt5-tools)
optdepends=('xclip: keepassxc-cli clipboard support under X server'
            'wl-clipboard: keepassxc-cli clipboard support under Wayland')
checkdepends=(xclip xorg-server-xvfb)
provides=(org.freedesktop.secrets keepassxc)
conflicts=(keepassxc)
source=(https://github.com/keepassxreboot/keepassxc/releases/download/$pkgver/keepassxc-$pkgver-src.tar.xz{,.sig}
        add-aur-extension-build-to-allowed-origins.patch)
sha256sums=('58fc45ae98e4b3ffb052103014f5b97a41fefd17102c7f56073934dd3a82ee67'
            'SKIP'
            'a150f3ce0d9d8827b6c767aa673be4af298aafd6f46ddd10373e32b832dd2017')
# List of signing keys can be found at https://keepassxc.org/verifying-signatures/
validpgpkeys=(BF5A669F2272CF4324C1FDA8CFB4C2166397D0D2
              71D4673D73C7F83C17DAE6A2D8538E98A26FD9C4
              AF0AEA44ABAC8F1047733EA7AFF235EEFB5A2517
              C1E4CBA3AD78D3AFD894F9E0B7A66F03B59076A8)

prepare() {
    cd keepassxc-"$pkgver"

    patch -p1 -i ../add-aur-extension-build-to-allowed-origins.patch
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

# check() {
#   xvfb-run --auto-servernum cmake --build build --target test
# }

package() {
  cmake --build build --target install -- DESTDIR="$pkgdir"
}
