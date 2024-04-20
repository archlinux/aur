# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-git
pkgver=1879.d1e9358f
pkgrel=1
pkgdesc="A Jellyfin music client for mobile and desktop"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
makedepends=('git' 'flutter-tool' 'flutter-target-linux' 'clang' 'cmake' 'ninja' 'xz')
provides=('finamp')
conflicts=('finamp')
source=("$_pkgname::git+$url.git#branch=desktop-beta"
        "finamp.desktop")
b2sums=('SKIP'
        '6b22ee624af345191ff4ce60140ba48591b9b42100d679232ae73aa7c3ae5cff1b74e4bcc71346278b8395ab7e67b59c78812a52f614f549136529b4bcea0a89')

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

    cd "$srcdir"
    install -Dm644 "finamp.desktop" -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -rdp --no-preserve=ownership "assets/icon/linux/." "$pkgdir/usr/share/icons/hicolor"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
