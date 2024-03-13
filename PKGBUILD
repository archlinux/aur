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
        '4b02bd1d09670cd4ebb3e366163e505f933102da395a4ce2f05b637eaaa056989e6f3cc22a2d9a7e6874013b6c30fc53ab521e77a97ebe2767042ad6cda3541c')

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
