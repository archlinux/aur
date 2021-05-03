# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=tok-git
pkgver=r86.fe69499
pkgrel=1
pkgdesc="Telegram client built using Kirigami"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/network/tok"
license=('GPL3')
depends=('kirigami2' 'knotifications' 'libtd-git' 'ki18n' 'icu')
makedepends=('git' 'extra-cmake-modules')
provides=('tok')
conflicts=('tok')
source=("git+${url}.git" 'cmakebuild.patch')
md5sums=('SKIP'
         '73e6e4344c2058f1b5bb6900debb5bd4')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/cmakebuild.patch"
}

build() {
  cmake -B build -S "${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
