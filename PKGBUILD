# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

_pkgname=yakuake
pkgname=yakuake-wayland-fixes
pkgver=25.12.3
pkgrel=1
pkgdesc='Drop-down terminal for KDE with Wayland fixes: toggle performance, KeepAbove, security hardening'
arch=(x86_64)
url='https://apps.kde.org/yakuake/'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc karchive kcolorscheme kconfig kconfigwidgets kcoreaddons
         kcrash kdbusaddons kglobalaccel ki18n kiconthemes kio knewstuff
         knotifications knotifyconfig konsole kparts kstatusnotifieritem kwayland
         kwidgetsaddons kwindowsystem kxmlgui qt6-base)
makedepends=(extra-cmake-modules)
provides=(yakuake)
conflicts=(yakuake)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        0001-optimize-Wayland-toggle-cache-DBus-rect-keep-PlasmaS.patch
        0002-add-KeepAbove-support-on-Wayland.patch
        0003-use-update-instead-of-repaint-for-async-coalesced-re.patch)
sha256sums=('362c9d376c4ff451d42777f8f8f9f21f2042cecb117f1b5cf2da77b10a43c9df'
            'a5c8d90936514aa47832d2e6028c8ddd128e482d7a8d06c2ecd87997a324fa40'
            'e36bc5c968d3937f986ff28394ee3f3b4085cce01bc777eebfa46c40ed5e60c4'
            '38a6cc546f0576dad865d568f7f7eef71c3b99dcf998384d561c7747bb1ad1cd')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i "$srcdir/0001-optimize-Wayland-toggle-cache-DBus-rect-keep-PlasmaS.patch"
  patch -Np1 -i "$srcdir/0002-add-KeepAbove-support-on-Wayland.patch"
  patch -Np1 -i "$srcdir/0003-use-update-instead-of-repaint-for-async-coalesced-re.patch"
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF \
    -DREMOVE_SENDTEXT_RUNCOMMAND_DBUS_METHODS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
