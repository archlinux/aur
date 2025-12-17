# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-git
pkgver=4433.363e59fb
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
makedepends=('git' 'clang' 'cmake' 'ninja' 'xz')
optdepends=('fvm' 'flutter-tool' 'flutter-target-linux')
provides=('finamp')
conflicts=('finamp')
source=("$_pkgname::git+$url.git#branch=redesign")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    flutter --suppress-analytics pub get
}

build() {
    cd "$_pkgname"
    flutter --suppress-analytics build linux --release --no-pub
}

package() {
    cd "$_pkgname/build/linux/x64/release/bundle"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/$_pkgname/"

    cd "$srcdir/$_pkgname"
    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications/"
    m4 -D__INSTALL_PATH__="/opt/$_pkgname" "assets/finamp.desktop.m4" > "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install icons
    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -rdp --no-preserve=ownership "assets/icon/linux/." "$pkgdir/usr/share/icons/hicolor"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
