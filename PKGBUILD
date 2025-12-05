# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>
# Contributor: Dan Nixon <dan@dan-nixon.com>

pkgname=qdmr-git
pkgver=0.13.2.r2.gf019e90
pkgrel=1
pkgdesc="A GUI application for configuring and programming cheap DMR radios - git version"
arch=('x86_64')
url="https://github.com/hmatuschek/qdmr"
license=('GPL-3.0-or-later')
depends=('libusb' 'qt6-tools' 'qt6-serialport' 'qt6-location' 'yaml-cpp')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('qdmr::git+https://github.com/hmatuschek/qdmr.git'
        'udev-rules.patch')
sha256sums=('SKIP'
            '1d15685397688aaaec4f356567581ee2ff0c5b71f748ab8a30896ef62658f7aa')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch --forward --strip=2 --input="${srcdir}/udev-rules.patch"
}

build() {
  local cmake_options=(
    -B build
    -S ${pkgname%-git}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D INSTALL_UDEV_RULES=ON
    -D INSTALL_UDEV_PATH=/etc/udev/rules.d
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
