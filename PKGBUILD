# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=iv-cli
pkgver=0.13.6
pkgrel=1
pkgdesc='A command-line image viewer using terminal graphics (Sixel, iTerm, Kitty)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kenshaw/iv"
license=('MIT')
depends=('ffmpeg' 'graphicsmagick' 'imagemagick' 'lcms2' 'libexif' 'libheif' 'libjpeg-turbo' 'libjxl' 'libvips' 'openjpeg2' 'poppler-glib')
optdepends=('libreoffice')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6af51f0f0890ff726c8def23d2e5d78569cdd197bc7da100d092589149e45281')

build() {
    cd iv-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external
                  -X main.name=iv
                  -X main.version=$pkgver" \
        -o iv
}

package() {
    cd iv-$pkgver
    install -Dm755 iv -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
