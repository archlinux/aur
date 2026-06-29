# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=autolock
pkgver=0.4
pkgrel=1
pkgdesc='A minimal X11 idle-watcher'
url='https://codeberg.org/ayari/autolock'
arch=(
    'x86_64'
    'aarch64'
)
license=('CC0-1.0')
depends=(
    'libx11'
    'libxss'
    'systemd-libs'
)
optdepends=(
    'slock: the default lock screen'
)
makedepends=(
    'gcc'
    'make'
    'patch'
)
options=(!debug)
provides=('autolock')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    'systemd-libs.patch'
)
sha256sums=(
    'e1643fb019bb441adadfc1a9d0659f53348e451adc7b193ba8d06bde933567c2'
    '66ae860a0f428979a551b3a95026e53897ee5ec68ab5e23ccdd86287e0883858'
)

prepare() {
    cd "$pkgname"
    patch -p1 < ../systemd-libs.patch
}

build() {
    cd "$pkgname"
    export CC="${CC:-gcc}"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 autolock "${pkgdir}/usr/bin/autolock"
    install -Dm644 autolock.1 "${pkgdir}/usr/share/man/man1/autolock.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/autolock.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
