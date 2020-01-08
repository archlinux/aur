# Maintainer: Vitaly Utkin <vautkin AT teknik DOT io>
pkgname=ovras
pkgver=4.0.1
pkgrel=1
epoch=0
pkgdesc="Advanced settings and custom behavior for SteamVR using OpenVR."
arch=("x86_64")
url="https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings"
license=("GPL")
depends=("qt5-declarative"
         "qt5-multimedia"
         "mesa")
optdepends=("dbus: media player support"
            "xorg-server: send keyboard keys")
source=("https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings/archive/v$pkgver.tar.gz")
sha256sums=("371d5a3f81a986ec5b3446c62a36cbf5eb951c97ea2b4a64752c4709bb8e6c76")

build() {
    cd "OpenVR-AdvancedSettings-$pkgver"

    additionalOptions=

    pacman -Qi xorg-server >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        additionalOptions="CONFIG+=noX11"
        echo "X11 features disabled."
    else
        echo "X11 features enabled."
    fi

    pacman -Qi dbus >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        additionalOptions+=" CONFIG+=noDBUS"
        echo "DBUS features disabled."
    else
        echo "DBUS features enabled."
    fi

    qmake PREFIX="$pkgdir/opt/" $additionalOptions
    make
}

package() {
    cd "OpenVR-AdvancedSettings-$pkgver"
    make install
}
