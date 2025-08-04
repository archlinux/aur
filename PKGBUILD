# Maintainer: Paolo De Donato <dedonato95@hotmail.it>

pkgname=labwc-noxwayland
pkgver=0.9.1
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (without XWayland)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(cairo glibc glib2 libinput libpng librsvg libsfdo libwlroots-0.19.so libxkbcommon libxml2 pango pixman ttf-font wayland hicolor-icon-theme)
# cmocka needed to run unit tests
makedepends=(git meson scdoc wayland-protocols)
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/labwc#tag=${pkgver}")
b2sums=('3c1a2eb42f86ab2859ed746ba7e836089446f718a4b31467c509a0d7eebb964219768a45d7138c4802c44dd6f9a5024084097292bb3c1e7cd2e3eee8ed331417')

prepare() {
    meson subprojects download --sourcedir=labwc
}

build() {
  arch-meson -Dman-pages=enabled -Dxwayland=disabled --wrap-mode=nodownload labwc build
  # arch-meson -Dman-pages=enabled -Dxwayland=disabled -Dtest=enabled --wrap-mode=nodownload labwc build
  # test compilation broken at 0.9.1
  meson compile -C build
}

check() {
    meson test --print-errorlogs -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
