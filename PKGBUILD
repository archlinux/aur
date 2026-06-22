# Maintainer: Heddxh <g31115710257 at gmail dot com>
# Contributor: JimMoen <LnJimMoen at outlook dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-without-gestures
_pkgname=kwin
pkgver=6.7.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='An easy to use, but flexible, wayland compositor. Patched to get rid of hardcoded touchpad gestures'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
provides=("$_pkgname=$pkgver" 'kwin-heddxh')
conflicts=('kwin' 'kwin-heddxh')
depends=(aurorae
         breeze
         glibc
         iio-sensor-proxy
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kidletime
         kirigami
         kitemmodels
         knewstuff
         knighttime
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwayland
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libei
         libepoxy
         libevdev
         libgcc
         libinput
         libpipewire
         libqaccessibilityclient-qt6
         libstdc++
         libxcb
         libxcvt
         libxkbcommon
         mesa
         milou
         pipewire-session-manager
         libplasma
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-svg
         qt6-tools
         systemd-libs
         vulkan-icd-loader
         wayland
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols
             python
             vulkan-headers
             wayland-protocols
             xorg-xwayland)
optdepends=('plasma-keyboard: virtual keyboard')
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/kwin/-/commit/cf00d9712316edecb4e1014bffe925136a74f072.patch
        0001-feature-allow-disable-hardcoded-touchpad-gestures.patch)
sha256sums=('d20b798094a9f58e57de55eca3d58b1cdcb7db2939eb8bf73918c4fab6d9aec5'
            'SKIP'
            'cb57c6364bc887ef36a059c2f51ef3e3a23f89a1b62f0f58884aeb1ebdea7f36'
            '6847f4739304e49ea8292231cd63cf25e7039af7ab59c1fee3bb2cdbebd079f0')
install=$_pkgname.install
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $_pkgname-$pkgver
  # https://bugs.kde.org/show_bug.cgi?id=520842#c17
  # Disable Color Pipeline for NVIDIA
  patch -Np1 -i ../cf00d9712316edecb4e1014bffe925136a74f072.patch
  patch -Np1 -i ../0001-feature-allow-disable-hardcoded-touchpad-gestures.patch
}

build() {
  cmake -B build  -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  setcap CAP_SYS_NICE=+ep "$pkgdir"/usr/bin/kwin_wayland
}
