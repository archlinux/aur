# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=pam_beacon-git
pkgver=r20.4a0bd5a
pkgrel=1
pkgdesc="PAM module for multi-factor authentication with Bluetooth Devices & Beacons"
arch=('x86_64')
url="https://github.com/muesli/pam-beacon"
license=('MIT')
makedepends=('go' 'git' 'pam')
depends=('pam')
provides=('pam_beacon')
source=('git+https://github.com/muesli/pam-beacon.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pam-beacon"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/pam-beacon"
    GOPATH=`pwd` go get -d -v
}

build() {
    cd "$srcdir/pam-beacon"
    GOPATH=`pwd` make
}

package() {
    cd "$srcdir/pam-beacon"

    # Install binary
    install -Dm755 "pam_beacon.so" "$pkgdir/usr/lib/security/pam_beacon.so"
    # Install PAM config
    install -Dm644 config/pam.d/system-auth-beacon "$pkgdir/etc/pam.d/system-auth-beacon"
    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
