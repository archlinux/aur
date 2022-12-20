# Maintainer: Kristen McWilliam <merritt_public at outlook dot com>
# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.8.0
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
provides=('nyrna')
depends=('glib2' 'gtk3' 'libkeybinder3' 'libappindicator-gtk3' 'util-linux' 'wmctrl' 'xdotool' 'xz')
makedepends=('git' 'flutter' 'clang' 'cmake' 'ninja')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz"
    "flutter::git+https://github.com/flutter/flutter.git"
)
sha256sums=(
    '74cb78c53d608f19248cd6c5aa80643f88bfe4320aa29290ceaf9357c3357acf'
    'SKIP'
)

_setpath() {
    PATH="$PATH:$srcdir/flutter/bin:$HOME/.pub-cache/bin:$HOME/.cargo/bin"
}

prepare() {
    _setpath

    # Enable desktop build
    flutter channel stable
    flutter config --enable-linux-desktop

    # Get dependencies
    cd "$pkgname-$pkgver"
    flutter clean
    flutter pub get
}

build() {
    _setpath

    cd "$pkgname-$pkgver"
    flutter build linux
}

package() {
    _setpath

    install -dm0755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/data" "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/lib" "$pkgdir/opt/$pkgname"
    install -Dm0755 "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/$pkgname" "$pkgdir/opt/$pkgname"

    install -dm0755 "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm0644 "$srcdir/$pkgname-$pkgver/packaging/linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm0644 "$srcdir/$pkgname-$pkgver/assets/icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
