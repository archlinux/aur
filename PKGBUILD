# Maintainer: ungaul <arch@0x404.org>
pkgname=sec-audit-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Linux privacy and security auditor"
arch=('x86_64' 'aarch64')
url="https://github.com/ungaul/sec-audit"
license=('MIT')
provides=('sec-audit')
conflicts=('sec-audit')

makedepends=(
    'cmake'
    'ninja'
    'gcc'
    'git'
)

optdepends=(
    'bind-tools: DNS resolution for telemetry connection check'
    'usbutils: USB device enumeration'
    'usbguard: USB device authorization enforcement'
    'curl: external IP and geolocation lookup'
)

source=("$pkgname::git+https://github.com/ungaul/sec-audit.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
