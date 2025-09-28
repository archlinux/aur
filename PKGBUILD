# Maintainer: Kristen McWilliam <merritt_public at outlook dot com>
# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.25.0
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
depends=('glib2' 'gtk3' 'libkeybinder3' 'libappindicator-gtk3' 'util-linux' 'wmctrl' 'xdotool' 'xz')
makedepends=('git' 'clang' 'cmake' 'ninja' 'unzip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz"
    "flutter::git+https://github.com/flutter/flutter.git"
)
sha256sums=('068fcfe3183ba460889cb7746a3b6a0494abfc7bcbb94bc691808b2324e87cc8'
            'SKIP')

_setpath() {
    PATH="$PATH:$srcdir/flutter/bin:$HOME/.pub-cache/bin:$HOME/.cargo/bin"
}

prepare() {
    _setpath

    # Enable desktop build
    flutter --no-version-check channel stable
    flutter --no-version-check config --no-analytics
    flutter --no-version-check config --enable-linux-desktop

    # Get dependencies
    cd "$pkgname-$pkgver"
    flutter --no-version-check clean
    flutter --no-version-check pub get

    # Disable dart analytics
    dart --disable-analytics
}

build() {
    _setpath

    cd "$pkgname-$pkgver"
    dart run build_runner build --delete-conflicting-outputs
    # Don't treat warnings as errors
    sed -i 's/\-Werror//g' linux/CMakeLists.txt
    flutter --no-version-check build linux
}

package() {
    _setpath

    install -dm0755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/data" "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/lib" "$pkgdir/opt/$pkgname"
    install -Dm0755 "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/$pkgname" "$pkgdir/opt/$pkgname"

    install -dm0755 "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm0644 "$srcdir/$pkgname-$pkgver/packaging/linux/codes.merritt.Nyrna.desktop" "$pkgdir/usr/share/applications/codes.merritt.Nyrna.desktop"
    install -Dm0644 "$srcdir/$pkgname-$pkgver/assets/icons/codes.merritt.Nyrna.png" "$pkgdir/usr/share/pixmaps/codes.merritt.Nyrna.png"
}
