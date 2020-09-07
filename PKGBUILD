# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=cinema-git
pkgver=r11.ac81a73
pkgrel=4
pkgdesc="Video player and video collection manager"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/cinema"
license=('GPL3')
depends=('kio' 'mauikit-git' 'attica' 'ki18n')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('cinema')
conflicts=('cinema')
source=("git+$url.git" 'org.kde.cinema.desktop')
sha256sums=('SKIP'
            '35ffe4295ae6170ca65ecb235b26fe025f14b8792fe9f82191af2511c9b33e0a')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}/build"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 ../src/assets/cinema.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cinema.svg"
  install -Dm644 "$srcdir/org.kde.cinema.desktop" "$pkgdir/usr/share/applications/"
  make DESTDIR="$pkgdir" install
}
