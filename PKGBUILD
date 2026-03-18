# Maintainer: schlndh <schlindenbuch.h@seznam.cz>
_pkgname=plasma-desktop
pkgname=$_pkgname-povd
pkgver=6.6.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE Plasma Desktop (patched for per-output virtual desktops)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(attica
         baloo
         emoji-font # for clock and language KCMs
         gcc-libs
         glibc
         kauth
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemmodels
         kitemviews
         kjobwidgets
         kmenuedit
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kpipewire
         krunner
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libcanberra
         libksysguard
         libwacom
         libx11
         libxcb
         libxcursor
         libxi
         libxkbcommon
         libxkbfile
         'libplasma<6.6.80'
         plasma-activities
         plasma-activities-stats
         plasma-workspace-povd
         plasma5support
         polkit-kde-agent
         powerdevil
         qt6-5compat
         qt6-base
         qt6-declarative
         sdl2
         solid
         sonnet
         systemd-libs
         systemsettings
         wayland
         xcb-util-keysyms
         xdg-user-dirs)
optdepends=('bluedevil: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration: OpenDesktop integration plugin'
            'kscreen: screen management'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new krunner plugins'
            'plasma-nm: Network manager applet'
            'plasma-pa: Audio volume applet'
            'scim: kimpanel SCIM support')
makedepends=(extra-cmake-modules
             intltool
             kaccounts-integration
             kdoctools
             libibus
             packagekit-qt6
             scim
             plasma-workspace-povd
             wayland-protocols
             xf86-input-libinput
             xorg-server-devel)
groups=(plasma)
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        povd.patch)
sha256sums=('c5c026bb5a4a29aaf79a9bc07e77873c851f625ef5ba94ce0b717da6f18b1a18'
            'SKIP'
            '592e39f85cd20a3ac85e44a3b42a5f4d2ab20e0c335674d580ed9b5ab34391df')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/povd.patch"
}

build() {
  cmake -B build  -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
