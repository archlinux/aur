# Maintainer: Valentin Lukyanets <valikluks95@gmail.com>
pkgname=draind
pkgver=0.3.1
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
sha256sums=('50201f04a06f3ea33de432ebc9b4fe65c7f62a9e6a7679cf72ced9ff2e668845')
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
