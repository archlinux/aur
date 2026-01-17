# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

# Note: namcap will warn about missing org.kde.plasma.login QML module
# This is a false positive - the QML is embedded in plasma-login-greeter binary as Qt resources

pkgname=plasma-login-manager-git
_pkgname=plasma-login-manager
pkgver=r1942.b44d3ef
pkgrel=1
pkgdesc='Plasma Login provides a display manager for KDE Plasma, forked from SDDM and with an new frontend providing a greeter, wallpaper plugin integration and System Settings module (KCM).'
url='https://invent.kde.org/plasma/plasma-login-manager'
arch=(x86_64)
license=('CC-BY-3.0 AND BSD-3-Clause AND CC0-1.0 AND GPL-2.0-only OR GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
    'sh'
    'systemd-libs'
    'kpackage'
    'layer-shell-qt'
    'qt6-declarative'
    'libplasma'
    'kdbusaddons'
    'kio'
    'kconfig'
    'kwindowsystem'
    'kirigami'
    'plasma-workspace'
    'libplasma>=6.5.90'
    'kcoreaddons'
    'qt6-base'
    'kservice'
    'kauth'
    'kcmutils'
    'ki18n'
    'libxau' # Hard dependency upstream
)
makedepends=(
    'extra-cmake-modules'
    'git'
    'qt6-tools'
)
source=(
    git+https://invent.kde.org/plasma/plasma-login-manager.git/
)
b2sums=('SKIP')
provides=(display-manager)
conflicts=(plasma-login-manager)
install=plasmalogin.install

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DDBUS_CONFIG_FILENAME=plasmalogin_org.freedesktop.DisplayManager.conf

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$srcdir/$_pkgname"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -Dm644 "$srcdir/$_pkgname"/LICENSE.CC-BY-3.0 -t "$pkgdir"/usr/share/licenses/"$pkgname"/

    for license in "$srcdir/$_pkgname/LICENSES/"*; do
        install -Dm644 "$license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$license")"
    done
}
