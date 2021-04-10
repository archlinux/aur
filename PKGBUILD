# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally-cli-git
pkgver=2.0.0.r12.75e7585
pkgrel=1
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally-cli"
license=('MIT')
depends=('libusb')
makedepends=('go' 'git')
provides=('zsa-wally-cli')
conflicts=('zsa-wally-cli' 'zsa-wally-cli-bin')
source=("git+${url}.git" '50-wally-cli.rules')
sha256sums=('SKIP' 'fb0486730617d8ef8524229fda63d256a61097ab2503e865edf5c7116d57df7d')

pkgver() {
    cd "$srcdir/wally-cli"
    printf "%s" "$(git describe --tags --long --match '*-linux' | sed 's/\([^-]*-\)g/r\1/;s/-linux//;s/-/./g')"
}

prepare() {
    cd "$srcdir/wally-cli"
    # Make wally-cli --version print the git version
    sed -i 's/var appVersion = ".*"/var appVersion = "'"$pkgver"'"/' main.go
}

build() {
    cd "$srcdir/wally-cli"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    go build
}

package() {
    cd "$srcdir/wally-cli"

    install -Dm755 wally-cli "$pkgdir/usr/bin/wally-cli"
    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
