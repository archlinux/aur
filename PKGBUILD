# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=finamp
pkgver=0.9.19_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
makedepends=('git' 'flutter-tool' 'flutter-target-linux' 'clang' 'cmake' 'ninja' 'xz')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver//_/-}.tar.gz")
b2sums=('e73282ee9a684601c7497dd4ebe0ae7e1de7943aba6b9aec47c397dbb7a1a5a0aed5ea44ddc9b4d11d3e79fa4923ed78b3ff2d0fb9817e8e974cb3daed74c7c9')

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
