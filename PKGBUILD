# Maintainer: someshwar <someshwar@example.com>
# Contributor: ZenScreen Team

pkgname=zenscreen
pkgver=1.0.0
pkgrel=3
pkgdesc="Digital Wellbeing for Linux (ZenScreen) - Screen Time Tracker"
arch=('any')
url="https://github.com/Someshwar1006/Digital-Wellbeing-for-Linux"
license=('GPL3')
depends=(
    'python>=3.11'
    'python-gobject'
    'python-cairo'
    'python-click'
    'python-rich'
    'python-pynput'
    'python-xlib'
    'python-dbus'
    'python-matplotlib'
    'python-appdirs'
    'gtk4'
    'libadwaita'
    'libnotify'
    'xprintidle'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'xdotool: for XWayland window detection'
    'python-pytest: for running tests'
)
provides=('zenscreen')
conflicts=('zenscreen-git')
backup=()
options=(!emptydirs)
install=zenscreen.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Someshwar1006/Digital-Wellbeing-for-Linux/archive/v$pkgver.tar.gz")
# For local development, use:
# source=("$pkgname-$pkgver::git+file:///path/to/local/repo")
sha256sums=('SKIP')

# If building from local source (for testing), uncomment this:
# source=("$pkgname-$pkgver.tar.gz")
# sha256sums=('SKIP')

build() {
    cd "$srcdir/Digital-Wellbeing-for-Linux-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Digital-Wellbeing-for-Linux-$pkgver"
    
    # Install Python package
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 data/zenscreen.desktop \
        "$pkgdir/usr/share/applications/com.zenscreen.app.desktop"
    
    # Install icon
    install -Dm644 data/icons/com.zenscreen.app.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.zenscreen.app.svg"
    
    # Install systemd user service
    install -Dm644 systemd/zenscreen.service \
        "$pkgdir/usr/lib/systemd/user/zenscreen.service"
        
    # Install autostart file (starts daemon on login)
    install -Dm644 data/zenscreen-autostart.desktop \
        "$pkgdir/etc/xdg/autostart/zenscreen-autostart.desktop"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
