# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=qt6curve-git
pkgver=1.9.0.rc1.r0.g0000000
pkgrel=3
pkgdesc="Qt6 widget style with extensive configurability (Qt6 version only, separate from qtcurve)"
arch=('x86_64')
url="https://github.com/ixnewton/qtcurve/tree/Qt6Curve_version"
license=('LGPL2.1')
depends=('qt6-base' 'qt6-svg'
         'kguiaddons' 'kconfig' 'kconfigwidgets'
         'ki18n' 'kio' 'kiconthemes' 'kwidgetsaddons'
         'kwindowsystem' 'frameworkintegration' 'kxmlgui'
         'karchive')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('qt6curve')
conflicts=('qt6curve' 'qtcurve')
source=("git+https://github.com/ixnewton/qtcurve.git#branch=Qt6Curve_version")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qtcurve"
  local _ver
  if _ver=$(git describe --long --tags 2>/dev/null); then
    printf '%s\n' "$_ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "1.9.0.rc1.r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/qtcurve"
  
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_QT6=ON \
    -DENABLE_QT5=OFF \
    -DENABLE_QT4=OFF \
    -DENABLE_GTK2=OFF \
    -DQTC_QT6_ENABLE_KDE=ON \
    -DQTC_ENABLE_X11=ON \
    -DQTC_INSTALL_PO=ON
  
  cmake --build build
}

package() {
  cd "$srcdir/qtcurve"
  DESTDIR="$pkgdir" cmake --install build
}