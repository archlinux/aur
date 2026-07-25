# Maintainer: Sebastian Palencsar <moin@nerdbear.de>
pkgname=bearwave-git
pkgver=1.2.0
pkgrel=1
pkgdesc="KDE-focused desktop internet radio app"
arch=('x86_64')
url="https://github.com/spalencsar/bearwave"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-multimedia-ffmpeg')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
provides=('bearwave')
conflicts=('bearwave')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  # Holt das letzte Tag (z.B. 1.2.0), die Anzahl der Commits danach und den Hash
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g' || \
  printf "1.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Wechsel auf Ninja spart Build-Zeit auf schwächeren Kisten
  cmake -B build -S "${pkgname%-git}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  # Lizenz sauber hinterlegen
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
