# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=finamp
pkgver=0.9.21_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
makedepends=('git' 'clang' 'cmake' 'ninja' 'xz')
optdepends=('fvm' 'flutter-tool' 'flutter-target-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver//_/-}.tar.gz")
b2sums=('462b2cea7bd4c979dbda6550fa4b3c688faddd3ef468daa55faa4df91ca8783c381e9bbb6ae4c92ede2825ba6a2ecd3fb65fcddc264e92ead0e2defc5041cb6b')

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
