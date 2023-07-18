# Maintainer: Victor Tran <vicr12345 at gmail dot com>
_pkg_networkmanager='networkmanager-qt6'
_pkg_modemmanager='modemmanager-qt6'
_pkg_bluez='bluez-qt6'
_pkg_pulseaudio='pulseaudio-qt6-git'
_pkg_polkit='polkit-qt6-git'

pkgname=('thedesk' 'td-polkitagent' 'xdg-desktop-portal-td' 'thedesk-platform' 'libthedesk')
pkgver=1.0.2
pkgrel=0
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thedesk"
license=('GPL3')
makedepends=('git' 'qt6-tools' 'qt6-positioning' 'cmake' 'clang' $_pkg_polkit 'libtdesktopenvironment' $_pkg_pulseaudio $_pkg_networkmanager $_pkg_modemmanager $_pkg_bluez 'qrencode' 'libthefile' 'contemporary-icons' 'contemporary-widgets' 'ttf-contemporary' 'xf86-input-libinput' 'libxi' 'libx11' 'qrencode')
source=("thedesk-$pkgver"::"https://github.com/theCheeseboard/thedesk/archive/refs/tags/v$pkgver.tar.gz"
        "kf6-patch.patch")
sha256sums=("600408180c7548f4dc049d348b0585bf0f104f1620a1caec63ee03a968512af6"
            "SKIP")

doInstallModule() {
	DESTDIR="$pkgdir" cmake --install "build/$1"
}

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/kf6-patch.patch"
}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_PREFIX_PATH='/opt/KF5-qt6/lib/pkgconfig;/opt/KF5-qt6/lib/cmake' \
		-DKF5BluezQt_DIR=/opt/KF5-qt6/lib/cmake/KF5BluezQt \
		-DKF5ModemManagerQt_DIR=/opt/KF5-qt6/lib/cmake/KF5ModemManagerQt \
		-DKF5NetworkManagerQt_DIR=/opt/KF5-qt6/lib/cmake/KF5NetworkManagerQt \
		-DKF5PulseAudioQt_DIR=/opt/KF5-qt6/lib/cmake/KF5PulseAudioQt \
		-DKF_VERSION_MAJOR=5 \
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
}
