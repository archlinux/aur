# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
pkgname=ruqola-better-git
_pkgname=ruqola
pkgver=2.1.0.r624.g4910cec
pkgrel=1
pkgdesc='Rocket.Chat client for the KDE desktop (Plasma 6 / qt6)'
arch=('x86_64')
url='https://invent.kde.org/network/ruqola'
license=('LGPL2.1')
depends=(
  # qt6 group
 'qt6-websockets' 'qt6-networkauth' 'qt6-multimedia'
 # kf6 group
 'kwidgetsaddons' 'ki18n' 'kcrash' 'kcoreaddons' 'syntax-highlighting' 'sonnet' 'ktextwidgets' 'knotifyconfig' 'kio' 'kiconthemes' 'kxmlgui' 'kidletime' 'prison' 'kdoctools' 'kstatusnotifieritem'
 # others
 'qtkeychain-qt6' 'hicolor-icon-theme' 'kuserfeedback' 'ktextaddons'
)
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=(ruqola)
conflicts=(ruqola)
source=("git+https://invent.kde.org/network/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  cmake -B "$srcdir/build" -S "$srcdir/$_pkgname" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev #\
    #--preset release-qt6
  cmake --build "$srcdir/build" #\
    # --preset release-qt6
}

check() {
  ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
