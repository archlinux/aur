# Maintainer: Maks Mazurov <foxcpp at yandex dot ru>
# Based on https://github.com/procxx/kepka/blob/dev/kepka.spec.
pkgname=kepka-git
pkgver=r3355.7debac66
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
    mkdir build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPACKAGED_BUILD=ON
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/build/Telegram/Telegram" "$pkgdir/usr/bin/kepka"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/$pkgname/lib/xdg/kepka.desktop" "$pkgdir/usr/share/applications/kepka.desktop"

    # I don't want to add conflicts=('telegram-desktop') thus I will not install tg.protocol.
    #install -d "$pkgdir/usr/share/kservices5"
    #install -m644 "$srcdir/$pkgname/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/$pkgname/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kepka.png"
    done
}
