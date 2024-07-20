# Maintainer: Interaccoonale <xzzzf.dsx@gmail.com>
pkgname=flut-renamer
pkgver=1.5.2
pkgrel=12
pkgdesc='A GUI application written in Flutter (using GTK on Linux), it helps users batch renaming their files in multiple ways, including inserting text, inserting file metadata and Exif data, replacing text, deleting text, rearranging, transliterating characters.'
arch=('x86_64')
url="https://github.com/sun-jiao/flut-renamer"
license=('GPL3')
depends=('gtk3')
makedepends=('flutter' 'clang' 'cmake' 'ninja')
source=("https://github.com/sun-jiao/flut-renamer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c00b0cc6a0f130966aea70f193e3002f0b314c6f5446b531ff37e27185d37259')

prepare() {
    cd "$pkgname-$pkgver"

    # Disable analytics and enable linux desktop
    flutter --no-version-check config --no-analytics
    flutter --no-version-check config --enable-linux-desktop

    # Pull dependencies within prepare, allowing for offline builds later on
    flutter --no-version-check pub get
}

build() {
    cd "$pkgname-$pkgver"
    flutter --no-version-check build linux --release --prefixed-errors
}

package() {
    # create the target folders
    install -dm 755 "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin/" "$pkgdir/usr/share/pixmaps/" "$pkgdir/usr/share/applications/"
    # copy the bundled output to /opt
    cp -rdp --no-preserve=ownership "./$pkgname-$pkgver/build/linux/x64/release/bundle/." "$pkgdir/opt/$pkgname/"
    cp "./$pkgname-$pkgver/build/linux/x64/release/bundle/data/flutter_assets/assets/desktop.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Flut Renamer" --categories "Utility" --exec "$pkgname %u" --icon "/usr/share/pixmaps/$pkgname.png"
    cp "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    # symlink to /usr/bin so the app can be found in PATH
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

