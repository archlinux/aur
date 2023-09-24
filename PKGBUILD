# Maintainer: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.15.4
pkgrel=1
pkgdesc="A cross-platform libre notes app written in Flutter"
arch=('x86_64')
url="https://github.com/adil192/saber"
license=('GPL3')
depends=('gtk3' 'bash' 'jsoncpp' 'libsecret' 'xdg-user-dirs')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'rustup')
source=("https://github.com/adil192/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "0001-Modify-.desktop-for-Arch-Linux.patch"
        "saber.sh")
sha256sums=('2a2e4c25505ed5229c50a5c853462ec6d16da42abf5aa265330a0629e9502467'
            '93e6e067fefad597117d7f6889df204082898b79dcd29853eaa5c879ab35b2df'
            '7beadd69cd9fc88ccc8916b27057498da652afbe4265d00cf9de20ea84bb2488')

prepare() {
    cd "$pkgname-$pkgver"

    # Disable analytics and enable linux desktop
    flutter --no-version-check config --no-analytics
    flutter --no-version-check config --enable-linux-desktop

    # Patch source to allow for better .desktop naming
    patch -p1 -i "$srcdir/0001-Modify-.desktop-for-Arch-Linux.patch"

    # Pull dependencies within prepare, allowing for offline builds later on
    flutter --no-version-check pub get
}

build() {
    cd "$pkgname-$pkgver"
    flutter --no-version-check build linux --release --prefixed-errors

    # Copy icon to source directory for installing
    cp assets/icon/resized/icon-128x128.png ./saber.png
}

package() {
    # Build directory for the final executable
    cd "$pkgname-$pkgver/build/linux/x64/release/bundle/"

    # Install application, licence and desktop file (with assets)
    install -dm 755 "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin/"
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/$pkgname/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/saber.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/saber.png" -t "$pkgdir/usr/share/pixmaps/"

    # Copy wrapper script to /usr/bin
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
