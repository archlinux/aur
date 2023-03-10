# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=i3lock-lixxia-git
pkgver=r344.be2a08a
pkgrel=2
pkgdesc='Copy of i3lock that displays a 12-hour clock and always shows unlock indicator'
arch=('i686' 'x86_64')
url='https://github.com/Lixxia/i3lock'
license=('BSD')
groups=('i3')
depends=('cairo' 'libev' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pam' 'xcb-util' 'xcb-util-xrm')
provides=('i3lock')
conflicts=('i3lock')
backup=('etc/pam.d/i3lock')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"

    # Patch compilation error: https://github.com/Lixxia/i3lock/issues/22
    sed -i 's/^int input_position;$/extern &/' unlock_indicator.c
}

build() {
    cd "$pkgname"

    autoreconf -fi
    mkdir -p build
    cd build
    ../configure \
        --prefix="${pkgdir}/usr" \
        --sysconfdir="${pkgdir}/etc"
    make
}

package() {
    cd "${pkgname}/build"

    make install
    install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
