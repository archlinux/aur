# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

_pkgname=labwc
pkgname=labwc-im-git
pkgver=0.7.0.r169.g7adf5533
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version with IME, IME popups and minimal text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots>=0.17' 'wlroots<0.18' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        '0001-IME-support-input-method.patch'
        '0002-IME-support-popups.patch'
        '0003-IME-support-text-input-v1.patch')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../0001-IME-support-input-method.patch
  patch -Np1 -i ../0002-IME-support-popups.patch
  patch -Np1 -i ../0003-IME-support-text-input-v1.patch
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
