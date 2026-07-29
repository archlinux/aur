# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=qt6curve-git
pkgver=1.9.0.rc1.r0.g0000000
pkgrel=1
pkgdesc="Qt6 widget style with extensive configurability (Qt6 version only, separate from qtcurve)"
arch=('x86_64')
url="https://github.com/ixnewton/qtcurve/tree/Qt6Curve_version"
license=('LGPL2.1')
depends=('qt6-base' 'qt6-svg' 'kf6-kguiaddons' 'kf6-kconfig' 'kf6-kconfigwidgets'
         'kf6-ki18n' 'kf6-kio' 'kf6-kiconthemes' 'kf6-kwidgetsaddons'
         'kf6-kwindowsystem' 'kf6-frameworkintegration' 'kf6-kxmlgui'
         'kf6-karchive')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('qt6curve')
conflicts=('qt6curve' 'qtcurve-qt6')
source=("git+https://github.com/ixnewton/qtcurve.git#branch=Qt6Curve_version")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qtcurve"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "1.9.0.rc1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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