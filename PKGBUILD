# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-desktop-interface
pkgver=6.7.4.2
pkgrel=1
pkgdesc='Sonic Desktop Interface'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-desktop-interface'
license=(LGPL-2.0-or-later)
depends=(baloo
         emoji-font # for clock and language KCMs
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kcrash
         kdbusaddons
         kdeclarative
         ki18n
         kitemmodels
         kitemviews
         kjobwidgets
         kmenuedit
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kpipewire
         kservice
         ksvg
         kwidgetsaddons
         kxmlgui
         libcanberra
         libstdc++
         libwacom
         libx11
         libxcb
         libxcursor
         libxi
         libxkbcommon
         libxkbfile
         plasma5support
         polkit-kde-agent
         powerdevil
         qt6-5compat
         qt6-base
         qt6-declarative
         sdl2
         solid
         sonic-activities
         sonic-activities-stats
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-open-collab
         sonic-frameworks-quick-ui
         sonic-frameworks-quick-ui-addons
         sonic-frameworks-runner
         sonic-frameworks-settings-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-system-monitor-library
         sonic-win
         sonic-workspace
         sonnet
         systemd-libs
         systemsettings
         xcb-util-keysyms
         xdg-user-dirs)
optdepends=('bluedevil: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration: OpenDesktop integration plugin'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new sonic-frameworks-runner plugins'
            'scim: kimpanel SCIM support'
            'sonic-audio-applet-pulse: Audio volume applet'
            'sonic-network-manager: Network manager applet'
            'sonic-screen: screen management')
makedepends=(intltool
             kaccounts-integration
             libibus
             packagekit-qt6
             scim
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools
             xf86-input-evdev
             xf86-input-libinput
             xf86-input-synaptics
             xorg-server-devel)
provides=(plasma-desktop)
conflicts=(plasma-desktop)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        '0001-add-explicit-input-backend-options.patch')
sha256sums=('45c1f2c66b05afc838509cf87a10eaf0d6f119fd082d2fdc13f86194111d5a0f'
            '63afec950ae88f89fcf206b8e40aab3dcc4f5a4df6f456b31ad3ebf20158f440')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir/0001-add-explicit-input-backend-options.patch"
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
	-DBUILD_KCM_MOUSE_EVDEV=ON \
	-DBUILD_KCM_TOUCHPAD_SYNAPTICS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
