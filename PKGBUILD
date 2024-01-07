# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Roman Gilg <subdiff@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kwin
pkgname=kwinft-git
pkgver=5.27.0.beta.0.r884.g7ea0e1602
pkgrel=1
pkgdesc='drop-in replacement for KWin with additional libwayland wrapping Qt/C++ library Wrapland'
arch=(x86_64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(python xcb-util-cursor qt6-sensors wrapland-git disman-git kdisplay-git wlroots \
         xorg-xwayland qt6-multimedia pipewire microsoft-gsl \
         knewstuff-git kdecoration-git kcmutils-git kio-git kdeclarative-git kscreenlocker-git)
makedepends=(git qt6-tools kdoctools extra-cmake-modules-git)
optdepends=('qt6-virtualkeyboard: virtual keyboard support for kwin-wayland' \
            'libplasma: plasma-framework6' \
            'breeze>=5.80.0' \
            'libqaccessibilityclient-qt6' \
	    'libkscreen-git: needed if kscreenlocker-git is used' )
provides=("$_pkgname=${pkgver}" "kwinft=${pkgver}")
conflicts=("$_pkgname" "kwinft")
source=("git+https://gitlab.com/kwinft/kwinft.git")
sha256sum=
install=kwinft.install

pkgver() {
  cd "${pkgname/-git}"
  git describe --long | sed 's/^kwinft\@//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir"/build
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir"/${pkgname/-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
sha256sums=('SKIP')
