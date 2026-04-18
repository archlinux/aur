# Maintainer: deliriouspork
pkgname=depk-sensitivity-matcher
pkgver=1.2.4
pkgrel=1
pkgdesc="Match mouse sensitivity between 3D games on Linux. Works on X11 and Wayland."
arch=('x86_64')
url="https://github.com/deliriouspork/DePk-Sensitivity-Matcher"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-evdev')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b9050e9c7042c5b8f049fad843cf6d19d5e2189e8b523c79c1215ae0fe7afe9')

package() {
    cd "$srcdir/DePk-Sensitivity-Matcher-$pkgver"

    # Install application files
    install -Dm644 main.py          "$pkgdir/usr/lib/$pkgname/main.py"
    install -Dm644 hotkeys.py       "$pkgdir/usr/lib/$pkgname/hotkeys.py"
    install -Dm644 mainwindow.ui    "$pkgdir/usr/lib/$pkgname/mainwindow.ui"
    install -Dm644 depk-sensitivity-matcher.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Install license
    install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install desktop entry
    install -Dm644 depk-sensitivity-matcher.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Compile and install setgid wrapper so input group access is not required
    gcc -o depk-wrapper wrapper.c
    install -Dm755 depk-wrapper     "$pkgdir/usr/bin/$pkgname"
    chown root:root                 "$pkgdir/usr/bin/$pkgname"
    chmod 4755                      "$pkgdir/usr/bin/$pkgname"
}