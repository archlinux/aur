# Maintainer: justbispo <aur.fyxy0@slmail.me>
# Maintainer: Renge <renge At renge.io>

pkgname=open-in-mpv
pkgver=2.4.3
pkgrel=3
pkgdesc="open-in-mpv handler and Chromium extension — a simple web extension which helps open video in mpv."
arch=('x86_64')
url="https://github.com/Baldomo/${pkgname}"
license=('GPL3')
depends=(
    'mpv'
    'xdg-utils'
)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname}_$pkgver.tar.gz")
sha256sums=('8bc927cf814886e076fd7276b2b59814629834e40a4c488c71a19e0b23144aad')
install="${pkgname}.install"

build() {
    cd "${pkgname}_$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd "${pkgname}_$pkgver"
    go test ./...
}

package() {
    cd "${pkgname}_$pkgver"
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 config.yml "$pkgdir"/etc/xdg/config.yml
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.md"
    install -Dm644 scripts/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

    # Install Chrome extension files
    install -dm755 "$pkgdir"/usr/lib/$pkgname-chromium
    install -Dm644 extension/Chrome/* "$pkgdir"/usr/lib/$pkgname-chromium/

    # Icons
    ln -s extension/Chrome/icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.png
    for i in 16 48 128; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s extension/Chrome/icon$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
    done
}
