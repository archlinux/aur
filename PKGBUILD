# Maintainer: Maks Mazurov <foxcpp at yandex dot ru>
# Based on https://github.com/procxx/kepka/blob/dev/kepka.spec.
pkgname=kepka-git
pkgver=r3407.93d2fd30
pkgrel=1
pkgdesc='Unofficial Telegram Desktop messaging app'
arch=('x86_64')
url='https://github.com/procxx/kepka'
license=('GPL')
depends=('qt5-imageformats' 'hicolor-icon-theme' 'gtk3' 'ffmpeg'
         'openal' 'openssl' 'minizip' 'zlib')
optdeps=('libappindicator-gtk3: AppIndicator tray icon')
makedepends=('git' 'cmake' 'dee' 'python')
source=("$pkgname::git+https://github.com/procxx/kepka.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$pkgname"

    # Out-of-source build is required.
    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPACKAGED_BUILD=ON
    make
}

package() {
    cd "$srcdir/$pkgname/build"

    make DESTDIR="$pkgdir" install

    # I don't want to add conflicts=('telegram-desktop') thus I will not install tg.protocol.
    rm -f "$pkgdir/usr/share/kservices5/tg.protocol"
}
