pkgname=tether-git
pkgver=0.2.21
pkgrel=1
pkgdesc="Bridge an iPhone to the Linux desktop: clipboard, files, messages, and notifications"
arch=('x86_64')
url="https://github.com/zackb/tether"
license=('MIT')
depends=('gtk3' 'libnotify' 'openssl' 'wayland' 'avahi' 'glib2' 'bluez' 'bluez-utils' 'bluez-obex')
makedepends=('cmake' 'ninja' 'git')
provides=('tether')
conflicts=('tether' 'tether-bin')
install=tether.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S "${pkgname%-git}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTETHER_BUILD_EXTENSIONS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
