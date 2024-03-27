# Maintainer: Interaccoonale <xzzzf.dsx@gmail.com>
pkgname=flut-renamer
pkgver=1.4.0
pkgrel=9
pkgdesc='A GUI application written in Flutter (using GTK on Linux), it helps users batch renaming their files in multiple ways, including inserting text, inserting file metadata and Exif data, replacing text, deleting text, rearranging, transliterating characters.'
arch=('x86_64')
url="https://github.com/sun-jiao/renamer"
license=('GPL3')
depends=('gtk3')
makedepends=('flutter' 'clang' 'cmake' 'ninja')
source=("https://github.com/sun-jiao/renamer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3db163beaecfab5149df46dd60a961e91d6f3f3a7a0a63c83f2bf6500518e9e3')

prepare() {
    cd "renamer-$pkgver"

    # Disable analytics and enable linux desktop
    flutter --no-version-check config --no-analytics
    flutter --no-version-check config --enable-linux-desktop

    # Pull dependencies within prepare, allowing for offline builds later on
    flutter --no-version-check pub get
}

build() {
    cd "renamer-$pkgver"
    flutter --no-version-check build linux --release --prefixed-errors
}

package() {
    # create the target folders
    install -dm 755 "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin/" "$pkgdir/usr/share/pixmaps/" "$pkgdir/usr/share/applications/"
    # copy the bundled output to /opt
    cp -rdp --no-preserve=ownership "./renamer-$pkgver/build/linux/x64/release/bundle/." "$pkgdir/opt/$pkgname/"
    cp "./renamer-$pkgver/build/linux/x64/release/bundle/data/flutter_assets/assets/desktop.png" "$pkgdir/usr/share/pixmaps/flut-renamer.png"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Flut Renamer" --categories "Utility" --exec "flut-renamer %u" --icon "/usr/share/pixmaps/flut-renamer.png"
    cp "flut-renamer.desktop" "$pkgdir/usr/share/applications/flut-renamer.desktop"
    # symlink to /usr/bin so the app can be found in PATH
    ln -s "/opt/$pkgname/flut-renamer" "$pkgdir/usr/bin/$pkgname"
}

