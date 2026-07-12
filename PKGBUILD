# Maintainer: Valentin Lukyanets <valikluks95@gmail.com>
pkgname=draind
pkgver=0.3.4
pkgrel=1
pkgdesc="Linux power management daemon inspired by Windows power options"
arch=('x86_64')
url="https://github.com/vlukyanets/draind"
license=('MIT')
depends=('systemd-libs' 'wayland')
makedepends=('cmake' 'ninja')
backup=('etc/draind/draind.json' 'etc/xdg/draind/draind-agent.json')
install=draind.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/vlukyanets/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8588fe0ee7df881ca3a83555c22c637f67b63d537029e5d0f7b782be651b445e')
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
