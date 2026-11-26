# Maintainer: CxOrg <clx.org@cloud-org.uk>
#
# Plasma 6 Quicklaunch applet - a customizable updated quicklaunch widget for KDE Plasma 6 panels.
#
# The plugin payload is staged in a private directory
# (/usr/lib/plasma6-applet-quicklaunch) and copied into each local user's
# ~/.local/lib/qt6/plugins by the .install hook. ~/.local is put first in
# QT_PLUGIN_PATH (/etc/xdg/plasma-workspace/env), so the user-local copy
# shadows the bundled kdeplasma-addons applet without any file conflicts.
# Removing this package removes the per-user copies and restores the bundled
# applet.

pkgname=plasma6-applet-quicklaunch
pkgver=6.5.80
pkgrel=7
pkgdesc="Customizable quicklaunch widget for KDE Plasma 6 panels"
arch=(x86_64)
install=plasma6-applet-quicklaunch.install
url="https://github.com/ixnewton/org.kde.plasma.quicklaunch"
license=(GPL-2.0-only GPL-3.0-only LicenseRef-KDE-Accepted-GPL)
depends=(qt6-base
         qt6-declarative
         kconfig
         kcoreaddons
         ki18n
         kio
         kservice
         kiconthemes
         kjobwidgets
         plasma-activities)
makedepends=(extra-cmake-modules
             cmake
             git)
source=("git+https://github.com/ixnewton/org.kde.plasma.quicklaunch.git#branch=main"
        "quicklaunch-plugin-path.sh")
sha256sums=('SKIP'
            '5cdbdbbbbfbe97e3697c6ad5e0e793214bee469712b6290c1d6c40cf76d2814a')

build() {
    cd "$srcdir/org.kde.plasma.quicklaunch"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_QTPLUGINDIR=lib/plasma6-applet-quicklaunch \
        -DBUILD_TESTING=OFF
    make -C build -j"$(nproc)"
}

package() {
    cd "$srcdir/org.kde.plasma.quicklaunch"
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/quicklaunch-plugin-path.sh" \
        "$pkgdir/etc/xdg/plasma-workspace/env/quicklaunch-plugin-path.sh"
}
