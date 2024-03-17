# Maintainer: Victor Tran <vicr12345 at gmail dot com>
_pkg_networkmanager='networkmanager-qt'
_pkg_modemmanager='modemmanager-qt'
_pkg_bluez='bluez-qt'
_pkg_pulseaudio='pulseaudio-qt'
_pkg_polkit='polkit-qt6'

pkgname=('thedesk' 'td-polkitagent' 'xdg-desktop-portal-td' 'thedesk-platform' 'libthedesk' 'thedesk-wayland')
pkgver=2.0
pkgrel=1
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thedesk"
license=('GPL3')
makedepends=('git' 'qt6-tools' 'qt6-positioning' 'cmake' 'clang' $_pkg_polkit 'libtdesktopenvironment' $_pkg_pulseaudio $_pkg_networkmanager $_pkg_modemmanager $_pkg_bluez 'qrencode' 'libthefile' 'contemporary-icons' 'contemporary-widgets' 'ttf-contemporary' 'xf86-input-libinput' 'libxi' 'libx11' 'qrencode' 'wayfire' 'glm')
source=("thedesk-$pkgver"::"https://github.com/theCheeseboard/thedesk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d89ff199f908cb16443caf900b9f0de03af6d0837c0528135b66f01d0bf3334')

doInstallModule() {
	DESTDIR="$pkgdir" cmake --install "build/$1"
}

build() {
	export XDG_DATA_DIRS=/usr/share
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
                -DQT_WAYLAND_SCANNER=/usr/lib/qt6/qtwaylandscanner \
                -DCMAKE_CXX_FLAGS="-isystem /usr/include/wlroots0.16" \
		-DFORCE_STABLE=ON
	cmake --build build
}

package_libthedesk() {
    depends=('libtdesktopenvironment')
    
    doInstallModule 'libthedesk';
}

package_thedesk-platform() {
    depends=('libcontemporary' 'libx11' 'contemporary-widgets' 'contemporary-icons' 'ttf-contemporary')
    
    doInstallModule 'platform'
}

package_td-polkitagent() {
    depends=($_pkg_polkit 'libtdesktopenvironment')

    doInstallModule 'polkitagent';
}

package_xdg-desktop-portal-td() {
    depends=('libthefile')

    doInstallModule 'desktop-portal'
}

package_thedesk() {
    depends=('kwin' 'libtdesktopenvironment' 'td-polkitagent' 'libthedesk' 'thedesk-platform' $_pkg_pulseaudio 'libx11' 'libxi' 'xf86-input-libinput' $_pkg_networkmanager $_pkg_modemmanager 'accountsservice' $_pkg_bluez 'qrencode' 'thedesk-xdg-utils' 'xdg-desktop-portal-td' 'qt6-positioning')
    
    doInstallModule 'desktop';
    doInstallModule 'plugins';
    doInstallModule 'startdesk';
    doInstallModule 'locker';
    
    rm $pkgdir/usr/share/wayland-sessions/thedesk-wayland.desktop
}

package_thedesk-wayland() {
    depends=('wayfire' 'wayfire-plugins-dbusqt' 'thedesk' 'glm')
    
    doInstallModule 'wayfire-plugins'
    
    mkdir -p $pkgdir/usr/share/wayland-sessions/
    cp $srcdir/build/thedesk-wayland.desktop $pkgdir/usr/share/wayland-sessions/
}
