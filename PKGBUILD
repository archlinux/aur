# Contributor: Davide Depau <davide@depau.eu>
# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=ydotool-git
pkgver=1.0.4.r0.g57ba7d0
pkgrel=1
epoch=1
pkgdesc="Generic command-line automation tool (no X!)"
depends=('glibc')
makedepends=('git' 'cmake' 'ninja' 'scdoc' 'systemd')
arch=('any')
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
provides=('ydotool')
conflicts=('ydotool')
install=ydotool.install
source=("$pkgname::git+$url"
        '80-uinput.rules')
sha256sums=('SKIP'
            '8613c8c45b9e467e5f16cb438d740598c19625d2412f52e306cbe91ccb08dbd9')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=/usr/share/man \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$srcdir/80-uinput.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}
