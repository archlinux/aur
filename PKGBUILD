# Maintainer: yubimusubi

_pkgbase=sf2dlib
pkgbase=${_pkgbase}-git
pkgname=${pkgbase}
provides=('sf2dlib')
pkgver=r119.c5aaec5
pkgrel=1
pkgdesc='Simple and Fast 2D library for the Nintendo 3DS (using ctrulib)'
arch=('any')
url='https://github.com/xerpi/sf2dlib'
license=('MIT')
options=(!strip staticlibs)
depends=('devkitarm' 'libctru')
makedepends=('git')
source=("$pkgbase::git+https://github.com/xerpi/sf2dlib.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgbase/libsf2d"
    source /etc/profile.d/devkitarm.sh

    make
}

package() {
    cd "$pkgbase/libsf2d"
    source /etc/profile.d/devkitarm.sh

    # Create necessary directories
    install -d $pkgdir$DEVKITPRO/libctru/lib
    install -d $pkgdir$DEVKITPRO/libctru/include

    # Makefile doesn't support DESTDIR so use DEVKITPRO instead
    make DEVKITPRO="$pkgdir$DEVKITPRO" install
}
