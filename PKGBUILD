# Maintainer: Kristen McWilliam <merritt_public at outlook dot com>
# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.27.2
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
depends=('glib2' 'gtk3' 'libkeybinder3' 'libappindicator-gtk3' 'util-linux' 'wmctrl' 'xz')
optdepends=('xdotool: X11 support')
makedepends=('git' 'clang' 'cmake' 'ninja' 'unzip' 'fvm')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('85849f51aad90fb8f17ea73ba9863d173d6c9fb4d25b09d1be5de8cd408ef790')

_setpath() {
    export FVM_CACHE_PATH="$srcdir/.fvm-cache"
    PATH="$PATH:$HOME/.pub-cache/bin:$HOME/.cargo/bin"
}

prepare() {
    _setpath

    cd "$pkgname-$pkgver"

    # Use latest stable Flutter via FVM
    fvm use stable --pin --force --skip-pub-get

    # Enable desktop build
    fvm flutter --no-version-check config --no-analytics
    fvm flutter --no-version-check config --enable-linux-desktop

    # Get dependencies
    fvm flutter --no-version-check clean
    fvm flutter --no-version-check pub get

    # Disable dart analytics
    fvm dart --disable-analytics
}

build() {
    _setpath

    cd "$pkgname-$pkgver"
    fvm dart run build_runner build --delete-conflicting-outputs
    # Don't treat warnings as errors
    sed -i 's/\-Werror//g' linux/CMakeLists.txt
    fvm flutter --no-version-check build linux
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
