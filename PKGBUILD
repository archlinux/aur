# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-3finger
pkgver=6.5.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=4
pkgdesc='An easy to use, but flexible, Wayland compositor - Patched for 3-finger overview'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
provides=(kwin)
conflicts=(kwin)
depends=(aurorae breeze gcc-libs glibc plasma-activities kauth kcmutils kcolorscheme 
         kconfig kcoreaddons kcrash kdbusaddons kdeclarative kdecoration kglobalaccel 
         kglobalacceld kguiaddons ki18n kidletime kirigami kitemmodels knewstuff 
         knighttime knotifications kpackage kquickcharts kscreenlocker kservice 
         ksvg kwayland kwidgetsaddons kwindowsystem kxmlgui lcms2 libcanberra 
         libdisplay-info libdrm libei libepoxy libinput libpipewire 
         libqaccessibilityclient-qt6 libxcb libxcvt libxkbcommon mesa 
         pipewire-session-manager libplasma qt6-5compat qt6-base qt6-declarative 
         qt6-sensors qt6-svg qt6-tools systemd-libs wayland xcb-util-keysyms xcb-util-wm)
makedepends=(extra-cmake-modules kdoctools krunner plasma-wayland-protocols python 
             wayland-protocols xorg-xwayland)
optdepends=('plasma-keyboard: virtual keyboard')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/kwin-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/kwin/-/commit/ef450432.patch
        kwin-3finger-overview.patch)
install=kwin.install
# Checksums: Added 'SKIP' for your local patch file
sha256sums=('258443f72180cf5a8141b440bb51a714a2e67e30867736290793ce50d7bb1d70'
            'SKIP'
            '4e35db494b436d2d4dc35eb467a90d93db2279561be3fc2c3f4a74a64ffa6081'
            '0f33037ad1cc1e833a489912a08739099a9bc95524198e3cd222b6884d681e41')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'
              '1FA881591C26B276D7A5518EEAAF29B42A678C20')

prepare() {
  # Apply the existing upstream freeze fix
  patch -d kwin-$pkgver -p1 < ef450432.patch 
  
  # Apply your 3-finger gesture patch
  patch -d kwin-$pkgver -p1 < kwin-3finger-overview.patch
}

build() {
  cmake -B build -S kwin-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
