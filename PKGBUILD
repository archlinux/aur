# Maintainer: Valentin Lukyanets <valikluks95@gmail.com>
pkgname=draind
pkgver=0.3.6
pkgrel=2
pkgdesc="Linux power management daemon inspired by Windows power options"
arch=('x86_64')
url="https://github.com/vlukyanets/draind"
license=('MIT')
depends=('systemd-libs' 'wayland')
makedepends=('cmake' 'ninja')
backup=('etc/draind/draind.json' 'etc/xdg/draind/draind-agent.json')
install=draind.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/vlukyanets/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('30397d70268118f865b7a39bb78a9e24ca53db33be88774e6a79511f570f5809')
options=('!debug')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 config/logind-draind.conf \
        "$pkgdir/etc/systemd/logind.conf.d/draind.conf"

    install -Dm644 config/draind-sysusers.conf \
        "$pkgdir/usr/lib/sysusers.d/draind.conf"
}
