# Maintainer: swim <swim853279614@163.com>
pkgname=plasma-lyrics
pkgver=0.4.3
pkgrel=1
pkgdesc='Native synchronized desktop lyrics widget for Plasma 6'
arch=('x86_64')
url='https://github.com/swim233/plasma-lyrics'
license=('GPL-2.0-only')
# Arch ships the KF6 libraries without a kf6- prefix. libplasma and ksvg are
# named explicitly rather than leaned on through plasma-workspace, because the
# QML this widget imports comes from them directly. kdeclarative owns
# org.kde.kquickcontrols, whose ColorButton the config dialog needs -- missing
# it breaks only the config dialog, so the widget itself still looks fine.
# glibc, libgcc and libstdc++ are what the binaries actually link against; every
# other entry only satisfies them by accident, which is what namcap reports.
# zlib is linked directly by the QQ provider (QRC payloads are a zlib stream
# under the cipher), so it is a real linkage rather than one satisfied by
# accident through Qt. fontconfig likewise: the QML module lists every font
# family's names in other languages through FcFontList itself.
depends=('plasma-workspace' 'libplasma' 'kirigami' 'ksvg' 'ki18n' 'kdeclarative'
         'qt6-base' 'qt6-declarative' 'zlib' 'fontconfig' 'glibc' 'libgcc' 'libstdc++')
# gettext supplies msgfmt, which builds the translation catalogues.
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swim233/plasma-lyrics/releases/download/v0.4.3/plasma-lyrics-0.4.3.tar.gz")
sha256sums=('d13ed31da86a2479db93f203854e788c1b3674169f2841f89e92e0d7745d41eb')

build() {
  # None rather than Release: it leaves the compiler flags to makepkg.conf, so
  # the package picks up Arch's hardening and debug-package settings instead of
  # CMake's own -O3 -DNDEBUG. No production code path relies on assert().
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
