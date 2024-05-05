# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=illuminanced-git
pkgver=r20.054d068
pkgrel=1
pkgdesc='Ambient Light Sensor Daemon for Linux'
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
url='https://github.com/mikhail-m1/illuminanced'

source=("${pkgname}::git+https://github.com/mikhail-m1/illuminanced"
        'fix-service-and-configuration.patch')
b2sums=('SKIP'
        '99c90c09003affb481ba3037091011197cccd7f40f80804faa67d30f955da0c5f32d3557cff49e7fb1438c2d6c621d81d5de43d1059c6637a18f7f220db68f4b')

backup=('etc/illuminanced.toml')

conflicts=('illuminanced')
provides=('illuminanced')

makedepends=('git' 'rust')
depends=('glibc' 'gcc-libs')

pkgver() {
    cd "${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare () {
    cd "${pkgname}"

    patch -p1 -i "$srcdir/fix-service-and-configuration.patch"
}

build () {
    cd "${pkgname}"

    cargo build --release
}

package () {
    cd "${pkgname}"

    install -Dm755 target/release/illuminanced -t "$pkgdir/usr/bin/"
    install -Dm644 illuminanced.toml -t "$pkgdir/etc/"
    install -Dm644 illuminanced.service -t "$pkgdir/usr/lib/systemd/system/"
}
