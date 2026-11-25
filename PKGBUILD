# Maintainer: CxOrg <clx.org@cloud-org.uk>
#
# Plasma 6 Quicklaunch applet - a customizable updated quicklaunch widget for KDE Plasma 6 panels.
#
# The plugin is installed to a private directory (/usr/lib/plasma6-applet-quicklaunch)
# and exposed to Plasma via QT_PLUGIN_PATH (/etc/xdg/plasma-workspace/env), so it
# shadows the bundled kdeplasma-addons copy without any file conflicts. Removing
# this package restores the bundled applet.

pkgname=plasma6-applet-quicklaunch
pkgver=6.5.80
pkgrel=6
pkgdesc="Customizable quicklaunch widget for KDE Plasma 6 panels"
arch=(x86_64)
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
            '43522340aef37c6278ed238ca5d4bc7b331f3c9a957bf41cea8fd4436bb2b806')

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
