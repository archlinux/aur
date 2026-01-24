# Maintainer: ctrl-q <34975747+ctrl-q@users.noreply.github.com>
pkgname=notification-tray-git
pkgver=r81.a291c2a
pkgrel=1
pkgdesc="FreeDesktop-compliant notification daemon with grouping, DnD, batching, and persistence"
arch=('x86_64')
url="https://github.com/ctrl-q/notification-tray"
license=('custom')
depends=('qt5-base' 'qt5-multimedia' 'dbus' 'glib2' 'python')
makedepends=('cmake' 'gcc' 'make' 'git')
optdepends=('gtest: for running tests'
            'lxqt-config: for LXQt theming configuration'
            'hicolor-icon-theme: fallback icon theme'
            'lxqt-notificationd: for additional notification themes'
            'systemd: for running as a user service')
install=notification-tray.install
source=("${pkgname%-git}::git+https://github.com/ctrl-q/notification-tray.git")
sha256sums=('SKIP')
provides=('notification-tray')
conflicts=('notification-tray')

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}" || exit
    mkdir -p build
    cd build || exit
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_TESTING=OFF
    make
}

check() {
    cd "${pkgname%-git}/build" || exit
    # Only run tests if gtest is available
    if command -v gtest-config &> /dev/null; then
        make test || warning "Tests failed"
    fi
}

package() {
    cd "${pkgname%-git}/build" || exit
    make DESTDIR="$pkgdir" install
    
    # Install license if it exists
    if [ -f "$srcdir/${pkgname%-git}/LICENSE" ]; then
        install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    fi
    
    # Install README
    install -Dm644 "$srcdir/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
