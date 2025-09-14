# Maintainer: Anna Rose Wiggins <annabunches at gmail dot com>
pkgname=joyful
pkgver=0.0.5
pkgrel=1
pkgdesc="Joystick remapper"
arch=('x86_64')
url="https://codeberg.org/annabunches/joyful"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'espeak-ng'
)
makedepends=('go>=1.24')
checkdepends=('go>=1.24')
options=(!debug)
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('7d466f340990e96c9cbff9be1d82d81fc680097d30eb393f3d3222df94a9726d')

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build/ ./...
}

check() {
    cd "$pkgname"

    go test ./...
}

package() {
    cd "$pkgname"

    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 build/evinfo   "$pkgdir"/usr/bin/evinfo
}
