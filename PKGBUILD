# Maintainer: yubimusubi

pkgname=sfillib-git
provides=('sfillib')
pkgver=r4.a684168
pkgrel=1
pkgdesc='Simple and Fast Image Loading library for the Nintendo 3DS (using sf2dlib and ctrulib)'
arch=('any')
url='https://github.com/xerpi/sfillib'
license=('MIT')
options=(!strip staticlibs)
depends=(
    'sf2dlib'
    'devkitarm-portlibs-libjpeg-turbo'
    'devkitarm-portlibs-libpng'
)
makedepends=('git' 'curl')
source=("$pkgname::git+https://github.com/xerpi/sfillib.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname/libsfil"
    source /etc/profile.d/devkitarm.sh

    make
}

package() {
    cd "$pkgname/libsfil"
    source /etc/profile.d/devkitarm.sh

    # Create necessary directories
    install -d $pkgdir$DEVKITPRO/libctru/lib
    install -d $pkgdir$DEVKITPRO/libctru/include

    # Makefile doesn't support DESTDIR so use DEVKITPRO instead
    make DEVKITPRO="$pkgdir$DEVKITPRO" install
}
