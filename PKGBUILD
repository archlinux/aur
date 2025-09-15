# Maintainer: Anna Rose Wiggins <annabunches at gmail dot com>
pkgname=joyful
pkgver=0.1.1
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
sha256sums=('fded3458cb4dd9be7adfdfc7f14b1752b00f4c80167a15ccf20383c9166d9e1f')

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
