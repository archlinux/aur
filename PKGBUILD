# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=pam_beacon-git
pkgver=r36.52d058d
pkgrel=1
pkgdesc="PAM module for multi-factor authentication with Bluetooth Devices & Beacons"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/pam-beacon"
license=('MIT')
depends=('pam')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "${extraflags} -extldflags \"${LDFLAGS}\"" \
        -buildmode=c-shared \
        -o "pam_beacon.so" .
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "pam_beacon.so" "$pkgdir/usr/lib/security/pam_beacon.so"
    install -Dm644 "config/pam.d/system-auth-beacon" "$pkgdir/etc/pam.d/system-auth-beacon"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
