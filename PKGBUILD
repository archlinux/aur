# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=coyim
pkgver=0.4.1
pkgrel=1
pkgdesc="A safe and secure chat client"
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('go')
url="https://coy.im"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/coyim/coyim/tar.gz/v$pkgver
        $pkgname.desktop)
sha256sums=('f2bf1e73562fbcc3a0b264a30f92dfe427dffe2046e9f44459087ecac5890098'
            '86826aca6023bbb0c85f5b1f1a72eaec48d308ea644a511f98437ef5763678a5')

prepare() {
    cd "$pkgname-$pkgver"

    if ! test -f "go.mod"; then
        go mod init $pkgname
        go mod tidy
    fi 
}

build() {
    cd "$pkgname-$pkgver"

    # See: https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -v .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm755 coyim -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "build/osx/mac-bundle/coyim.iconset/icon_256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
