# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on kde-thumbnailer-apk

pkgname=kde-thumbnailer-apk-libarchive
pkgver=1.1+libarchive
pkgrel=2
pkgdesc="Preview image generator plugin for APK files (libarchive branch)"
arch=('i686' 'x86_64')
url="https://github.com/z3ntu/kde-thumbnailer-apk"
license=('GPL')
depends=('kio' 'libarchive')
conflicts=('kde-thumbnailer-apk')
provides=('kde-thumbnailer-apk=1.1')
makedepends=('cmake' 'extra-cmake-modules' 'libarchive')
source=("$pkgname.tar.gz::$url/archive/libarchive.tar.gz")
sha256sums=('ca43a2dc7731ba3791b578da925d8ea9cd32ebdde5950c65b7dabc4072cfbfa7')

prepare() {
  sed -i $pkgname/apkcreator.cpp -e \
    '/#include <archive_entry.h>/a #include <optional>'
  patch $pkgname/CMakeLists.txt <<'EOF'
@@ -2 +2 @@ project(kde-thumbnailer-apk)
-cmake_minimum_required(VERSION 2.8.12)
+cmake_minimum_required(VERSION 3.16.0)
@@ -17 +17 @@ find_package(Qt5 REQUIRED COMPONENTS Widgets)
-find_package(KF5 REQUIRED COMPONENTS KIO Archive)
+find_package(KF5 REQUIRED COMPONENTS KIO)
@@ -25 +25 @@ target_link_libraries(apkthumbnail PRIVATE
-     Qt5::Widgets KF5::KIOWidgets KF5::Archive ${LibArchive_LIBRARIES}
+     Qt5::Widgets KF5::KIOWidgets ${LibArchive_LIBRARIES}
@@ -30 +30 @@ target_link_libraries(apkthumbnail_test
-     Qt5::Widgets KF5::KIOWidgets KF5::Archive ${LibArchive_LIBRARIES}
+     Qt5::Widgets KF5::KIOWidgets ${LibArchive_LIBRARIES}
EOF
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -B $pkgname/build $pkgname
  cmake --build $pkgname/build
}

package() {
  DESTDIR="$pkgdir" cmake \
    --build $pkgname/build --target install
}
