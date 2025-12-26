# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

# Note: namcap will warn about missing org.kde.plasma.login QML module
# This is a false positive - the QML is embedded in plasma-login-greeter binary as Qt resources

pkgname=plasma-login-manager-git
_pkgname=plasma-login-manager
pkgver=r1883.d8a3065
pkgrel=3
pkgdesc='Plasma Login provides a display manager for KDE Plasma, forked from SDDM and with an new frontend providing a greeter, wallpaper plugin integration and System Settings module (KCM).'
url='https://invent.kde.org/plasma/plasma-login-manager'
arch=(x86_64)
license=('CC-BY-3.0 AND BSD-3-Clause AND CC0-1.0 AND GPL-2.0-only OR GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
    kpackage
    layer-shell-qt
    qt6-declarative
    libplasma
    kdbusaddons
    kio
    kconfig
    kwindowsystem
    kirigami
    plasma-workspace
    kcoreaddons
    qt6-base
    kservice
    kauth
    kcmutils
    ki18n
    libxau # Hard dependency upstream
)
makedepends=(
    extra-cmake-modules
    cmake
    git
    qt6-tools
)
source=(
    git+https://invent.kde.org/plasma/plasma-login-manager
    plasmalogin.sysusers
    plasmalogin.tmpfiles
    plasmalogin-greeter.patch
)
b2sums=('SKIP'
        'a2d463ed3951f5261ca472b54761dbc3d2d135a70a780c859400421e3b3d1ea1dbe18cc1bacc477165aed04e238ddad98bf36dc02e9183576ee518b3cb7b5f6e'
        '0ad6e65aea70e5866ce6bd60be717d365f431116d1831409ec263d518f6561e4089ab30253ae93d44b21b4bb1ccd49ce81917f36969301b1fa68ac8cb614dbc3'
        '89c305f92c6fcde45a8767f58f8e8ccbeca9ebe5b7a2a96e3395514ad4a8d72d288d3406c8da2f7cbcbabbf62aee3107da9882445d17c41b6b9d5f3e8ba9b10c'
)
provides=(display-manager)
backup=(
    'usr/lib/pam.d/plasmalogin'
    'usr/lib/pam.d/plasmalogin-autologin'
    'usr/lib/pam.d/plasmalogin-greeter'
    'usr/lib/plasma-login/defaults.conf'
    'usr/share/plasmalogin/scripts/wayland-session'
    'usr/share/plasmalogin/scripts/Xsession'
    'usr/share/plasmalogin/scripts/Xsetup'
    'usr/share/plasmalogin/scripts/Xstop'
)
install=plasmalogin.install

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd $_pkgname
    patch -p1 -i ../plasmalogin-greeter.patch
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DINSTALL_PAM_CONFIGURATION=arch \
        -DSESSION_COMMAND=/usr/share/plasmalogin/scripts/Xsession \
        -DWAYLAND_SESSION_COMMAND=/usr/share/plasmalogin/scripts/wayland-session \
        -DBUILD_TESTING=OFF \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=plasmalogin_org.freedesktop.DisplayManager.conf \
        -Wno-dev

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install sysusers configuration
    install -Dm644 plasmalogin.sysusers "$pkgdir/usr/lib/sysusers.d/plasmalogin.conf"

    # Install tmpfiles configuration
    install -Dm644 plasmalogin.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/plasmalogin.conf"

    # Create directory for default configuration
    install -dm755 "$pkgdir/usr/lib/plasma-login"

    "$pkgdir"/usr/bin/plasmalogin --example-config > "$pkgdir"/usr/lib/plasma-login/defaults.conf

    # Don't set PATH in /usr/lib/plasma-login/defaults.conf
    sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/plasma-login/defaults.conf

    # Append missing critical settings (based on SDDM configuration on Arch Linux)
    # Add to [General] section
    sed -i '/^\[General\]/a DisplayServer=wayland' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[General\]/a HaltCommand=/usr/bin/systemctl poweroff' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[General\]/a RebootCommand=/usr/bin/systemctl reboot' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[General\]/a Numlock=none' "$pkgdir"/usr/lib/plasma-login/defaults.conf

    # Add to [Wayland] section  
    sed -i '/^\[Wayland\]/a CompositorCommand=kwin_wayland --drm --no-lockscreen --no-global-shortcuts --locale1' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[Wayland\]/a EnableHiDPI=true' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[Wayland\]/a SessionCommand=/usr/share/plasmalogin/scripts/wayland-session' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[Wayland\]/a SessionDir=/usr/share/wayland-sessions' "$pkgdir"/usr/lib/plasma-login/defaults.conf

    # Add to [X11] section
    sed -i '/^\[X11\]/a DisplayCommand=/usr/share/plasmalogin/scripts/Xsetup' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[X11\]/a DisplayStopCommand=/usr/share/plasmalogin/scripts/Xstop' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[X11\]/a SessionCommand=/usr/share/plasmalogin/scripts/Xsession' "$pkgdir"/usr/lib/plasma-login/defaults.conf
    sed -i '/^\[X11\]/a SessionDir=/usr/share/xsessions' "$pkgdir"/usr/lib/plasma-login/defaults.conf

    # Install license files (note the $_pkgname subdirectory)
    install -Dm644 "$srcdir/$_pkgname"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -Dm644 "$srcdir/$_pkgname"/LICENSE.CC-BY-3.0 -t "$pkgdir"/usr/share/licenses/"$pkgname"/

    for license in "$srcdir/$_pkgname/LICENSES/"*; do
        install -Dm644 "$license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$license")"
    done
}
