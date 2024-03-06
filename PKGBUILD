# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=qtcurve
pkgname=(qtcurve-utils qtcurve-gtk2 qtcurve-qt5 qtcurve-kde)
epoch=1
pkgver=1.9.0
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk'
arch=(x86_64)
url='https://github.com/KDE/qtcurve/'
license=(LGPL)
groups=(qtcurve)
makedepends=(extra-cmake-modules gtk2 kdelibs4support kdoctools5 frameworkintegration5 kdesignerplugin kinit)
source=(https://download.kde.org/stable/$pkgbase/$pkgbase-$pkgver.tar.xz{,.sig}
        qtcurve-gcc9.patch::"https://invent.kde.org/system/qtcurve/-/commit/ee2228ea.patch"
        qtcurve-qt5.15.patch::"https://invent.kde.org/system/qtcurve/-/commit/44e2a35e.patch")
sha256sums=('281f5e3d13b0c1c0aeea6f5c7e895aedcb8f4ce91bdbd12d068d3616bc6d2f99'
            'SKIP'
            'fddbc6a58f5ee14de38f42554a3b559835361524e5a416d62500ff62c4265748'
            'b965861d96681b446de5693d87d762861a00feff77c79dc243edc2b60e82ad3e')
validpgpkeys=(D88390B2991F8242FABD2A3C07F45E2A1937DD32) # Yichao Yu <yyc1992@gmail.com>

prepare() {
  cd $pkgbase-$pkgver
  patch -p1 -i ../qtcurve-gcc9.patch # Fix build with GCC 9
  patch -p1 -i ../qtcurve-qt5.15.patch # Fix build with Qt 5.15
}

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DQTC_QT5_ENABLE_KDE=false \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  cmake -B build-kde S $pkgbase-$pkgver \
    -DENABLE_GTK2=false
  cmake --build build-kde
}

package_qtcurve-utils() {
  pkgdesc='A configurable set of widget styles for KDE and Gtk (shared libraries)'
  depends=(gcc-libs
           glibc
           libx11
           libxcb)
  DESTDIR="$pkgdir" cmake --install build/lib/utils

# Install translations
  mkdir "$pkgdir"/usr/share
  cp -r build/locale "$pkgdir"/usr/share 
}

package_qtcurve-gtk2() {
  pkgdesk='A configurable set of widget styles for Gtk2'
  depends=(cairo
           gcc-libs
           gdk-pixbuf2
           glib2
           glibc
           gtk2
           pango
           perl
           qtcurve-utils)
  DESTDIR="$pkgdir" cmake --install build/gtk2
  DESTDIR="$pkgdir" cmake --install build/lib/cairo
}

package_qtcurve-qt5() {
  pkgdesc='A configurable set of widget styles for Qt5'
  depends=(gcc-libs
           glibc
           qt5-base
           qt5-svg
           qt5-x11extras
           qtcurve-utils)
  groups=()
  DESTDIR="$pkgdir" cmake --install build/qt5
}

package_qtcurve-kde() {
  pkgdesc='A configurable set of widget styles for Qt5 (with KDE integration)'
  depends=(frameworkintegration5
           gcc-libs
           glibc
           karchive5
           kcompletion5
           kconfig5
           kcoreaddons5
           kdelibs4support
           kconfigwidgets5
           kguiaddons5
           ki18n5
           kiconthemes5
           kio5
           kwidgetsaddons5
           kwindowsystem5
           kxmlgui5
           qt5-base
           qt5-svg
           qt5-x11extras
           qtcurve-utils)
  conflicts=(qtcurve-qt5)
  DESTDIR="$pkgdir" cmake --install build-kde/qt5
}
