# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=finamp
pkgver=0.9.8_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
makedepends=('git' 'flutter-tool' 'flutter-target-linux' 'clang' 'cmake' 'ninja' 'xz')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver//_/-}.tar.gz")
b2sums=('be5814a366c4c457c655efd5d072cb3826ab6d21525b4c781ef06778fbeb4c3d2cec06b893a6c7b25a89e4828a3661ed0307dcfbc3d3de5718bab1852c67a296')

prepare() {
    cd "$pkgname-${pkgver//_/-}"
    flutter --suppress-analytics pub get
}

build() {
    cd "$pkgname-${pkgver//_/-}"
    flutter --suppress-analytics build linux --release --no-pub
}

package() {
    cd "$pkgname-${pkgver//_/-}/build/linux/x64/release/bundle"
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/$pkgname/"

    cd "$srcdir/$pkgname-${pkgver//_/-}"
    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications/"
    m4 -D__INSTALL_PATH__="/opt/$pkgname" "assets/finamp.desktop.m4" > "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icons
    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -rdp --no-preserve=ownership "assets/icon/linux/." "$pkgdir/usr/share/icons/hicolor"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
