# Controbutor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Vitaly Utkin (https://aur.archlinux.org/account/vautkin)
pkgname=ovras
pkgver=5.8.11
pkgrel=1
epoch=0
pkgdesc="Advanced settings and custom behavior for SteamVR using OpenVR (OVR)."
arch=("x86_64")
url="https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings"
license=("GPL-3.0-or-later")
depends=(
  "gcc-libs"
  "glibc"
  "libx11"
  "libxtst"
  "mesa"
  "qt5-base"
  "qt5-declarative"
  "qt5-multimedia"
  "qt5-websockets"
  "qt6-declarative"
  "qt6-multimedia"
)
optdepends=(
  "dbus: media player support"
  "libpulse: pulse audio support"
  "xorg-server: send keyboard keys"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings/archive/v$pkgver.tar.gz"
)
sha256sums=(
  "2bd7e610a3b44e1525621b6fef17b4f0e1f40f8c4719bc0d4540cd8f81f3f8c5"
)

build() {
    cd "OpenVR-AdvancedSettings-$pkgver"

    _additionalOptions=

    # Attempting to compile without package will result in compile error
    pacman -Qi xorg-server >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        _additionalOptions="CONFIG+=noX11"
        echo "X11 features disabled."
    else
        echo "X11 features enabled."
    fi

    # Attempting to compile without package will result in compile error
    pacman -Qi dbus >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        _additionalOptions+=" CONFIG+=noDBUS"
        echo "DBUS features disabled."
    else
        echo "DBUS features enabled."
    fi

    # Attempting to compile without package will result in compile error
    pacman -Qi libpulse >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        _additionalOptions+=" CONFIG+=noPulse"
        echo "Pulse features disabled."
    else
        echo "Pulse features enabled."
    fi

    qmake -Wnone -nocache PREFIX="$pkgdir/opt/" $_additionalOptions
    make
}

package() {
    cd "OpenVR-AdvancedSettings-$pkgver"

    # Add .desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cp "src/package_files/linux/AdvancedSettings.desktop" "$pkgdir/usr/share/applications/"
    sed -i 's/Exec=.*/Exec=\/opt\/AdvancedSettings\/AdvancedSettings/' "$pkgdir/usr/share/applications/AdvancedSettings.desktop"

    # Add correct desktop icon to desktop file
    sed -i 's/Icon=.*/Icon=\/opt\/AdvancedSettings\/AdvancedSettings.png/' "$pkgdir/usr/share/applications/AdvancedSettings.desktop"
    # Dir doesn't exist before `make install`
    mkdir -p "$pkgdir/opt/AdvancedSettings/"
    cp "src/res/img/icons/thumbicon.png" "$pkgdir/opt/AdvancedSettings/AdvancedSettings.png"

    # Make program use correct working dir
    echo "Path=/opt/AdvancedSettings" >> "$pkgdir/usr/share/applications/AdvancedSettings.desktop"

    # Enable command line usage
    mkdir -p "$pkgdir/usr/bin/"
    ln -s /opt/AdvancedSettings/AdvancedSettings "$pkgdir/usr/bin/ovras"

    # Install
    make install
}
