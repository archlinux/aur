# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Roman Gilg <subdiff@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kwin
pkgname=kwinft-git
pkgver=5.27.0.beta.0.r764.gd913702e3
pkgrel=1
pkgdesc='drop-in replacement for KWin with additional libwayland wrapping Qt/C++ library Wrapland'
arch=(x86_64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(python xcb-util-cursor plasma-framework kcmutils kio breeze kinit qt6-sensors wrapland disman kscreen kscreenlocker pipewire libqaccessibilityclient-qt6 xorg-xwayland kdeclarative wlroots)
makedepends=(git 'extra-cmake-modules>=5.240.0' qt6-tools kdoctools)
optdepends=('qt6-virtualkeyboard: virtual keyboard support for kwin-wayland')
provides=("$_pkgname=${pkgver}" "kwinft=${pkgver}")
conflicts=("$_pkgname" "kwinft")
source=("$_pkgname::git+https://gitlab.com/kwinft/kwinft.git")
sha256sums=('SKIP')
install=kwinft.install

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^kwinft\@//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir"/build
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir"/$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
