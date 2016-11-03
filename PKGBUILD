# Maintainer: Tarmo Heiskanen <turskii@gmail.com>

pkgname=triggerhappy-git
pkgver=r170
pkgrel=1
pkgdesc="A lightweight hotkey daemon"
arch=('i686' 'x86_64')
url="https://github.com/wertarbyte/triggerhappy"
license=('GPL')
conflicts=('triggerhappy')
provides=('triggerhappy')
depends=('libsystemd')
makedepends=('git' 'linux-api-headers')
source=('git+https://github.com/wertarbyte/triggerhappy')
md5sums=('SKIP')

pkgver() {
    cd "triggerhappy"
    printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/triggerhappy"
    make
}

package() {
    cd "$srcdir/triggerhappy"
    make DESTDIR="$pkgdir/" install

    install -D -m 644 -t "$pkgdir/etc/triggerhappy/triggers.d" "triggerhappy.conf.examples"
    install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "systemd/triggerhappy.service" "systemd/triggerhappy.socket"
    install -D -m 644 -T "udev/triggerhappy-udev.rules" "$pkgdir/usr/lib/udev/rules.d/97-triggerhappy.rules"

    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

