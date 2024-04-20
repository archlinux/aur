# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-git
pkgver=1711.ac09018f
pkgrel=1
pkgdesc="A Jellyfin music client for mobile and desktop"
arch=("x86_64" "aarch64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
makedepends=('git' 'flutter' 'clang' 'cmake' 'ninja' 'xz')
provides=('finamp')
conflicts=('finamp')
source=("$_pkgname::git+$url.git#branch=desktop-beta"
        "finamp.desktop")
b2sums=('SKIP'
        'd95378664c07eb1f439fe1bb863e6c6661fab98ccafcc80d0fc76fcdc9bd511c6ca38293b2947f5689e702e192a1891259fa78977a86af8dd28e2639e01e653b')

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
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
