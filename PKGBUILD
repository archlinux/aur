# Maintainer: Waner Pena <wanerpena@gmail.com>
pkgname=plasma-snap-assistant
pkgver=0.1.0
pkgrel=1
pkgdesc="Visual window snapping overlay for KDE Plasma 6"
arch=('x86_64')
url="https://github.com/waner11/plasma-snap-assistant"
license=('GPL-2.0-or-later')
depends=('kwin' 'qt6-base' 'knotifications' 'kconfig' 'kcoreaddons' 'kstatusnotifieritem')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22f9d7d5e18d5dd96031cf08222df7f310088084d2bdba14585e878b535bd86c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build tray companion
    cmake -S plasma-snap-assistant-tray -B build-tray \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build-tray
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install KWin Effect (filesystem copy, not kpackagetool6).
    # Users can also install per-user via `make install` / kpackagetool6.
    install -dm755 "$pkgdir/usr/share/kwin/effects/plasma-snap-assistant"
    cp -r kwin-effect-plasma-snap-assistant/* "$pkgdir/usr/share/kwin/effects/plasma-snap-assistant/"

    # Install tray companion. CMake installs:
    #   /usr/bin/plasma-snap-assistant-tray
    #   /etc/xdg/autostart/plasma-snap-assistant-tray.desktop
    #   /usr/share/applications/plasma-snap-assistant-tray.desktop
    #   /usr/share/icons/hicolor/scalable/apps/plasmasnap-grid.svg
    #   /usr/share/knotifications6/plasma-snap-assistant-tray.notifyrc
    #   /etc/xdg/plasma-snap-assistantrc (system-wide default tray config)
    # The install-time gtk-update-icon-cache step self-skips because DESTDIR is set.
    DESTDIR="$pkgdir" cmake --install build-tray
}
