# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='strix-claw'
pkgver=r6.78eef095b3
pkgrel=1
pkgdesc="Daemon that prevents freezes of Asus Strix Claw mice"
arch=('x86_64')
url='https://github.com/hamer/strix-claw'
license=('GPL3')
depends=('libusb>=1.0')
makedepends=('git')
source=("$pkgname-$pkgver::git+${url}.git?signed#commit=78eef095b3968124bbf1f58ebd54a7d52403f805"
        'Makefile-CFLAGS_LDFLAGS.patch'
        'strix-claw.service-binary_path.patch')
sha256sums=('SKIP'
            '069fce3bf1221e356beb16b7a78f207e8f3f851e5708144a473941ecc725072d'
            'e8895bac5b8b92815829c1708c99591e6522917804ec00e335dbd977a3fae727')
validpgpkeys=('3E67039304CF466151CA444FC1D9BACAFA1A39DC')

pkgver() {
    cd "$pkgname-$pkgver"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname-$pkgver"
    for patch_file in "$srcdir"/*.patch; do
        patch --forward -i "$patch_file"
    done
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -D -t "$pkgdir/usr/lib" strix-claw
    install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" strix-claw.service
}
