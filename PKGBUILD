# Maintainer: Jan Samek <samekh@email.cz>

_gitname=SF100Linux
pkgname=sf100linux-git
pkgver=1.2.1.03.r31.g7d8be06
pkgrel=1
pkgdesc='Linux software (dpcmd) for Dediprog SF100 and SF600 SPI flash programmers'
arch=('x86_64')
url="https://github.com/DediProgSW/SF100Linux"
license=('GPL2')
depends=('libusb-compat')
provides=('sf100linux')
conflicts=('sf100linux')
makedepends=('git')
source=(
    "git+https://github.com/DediProgSW/${_gitname}.git"
    "0001-makefile-fix-use-of-CFLAGS-and-LDFLAGS.patch"
    "0002-parse.c-fix-return-value-type.patch"
)
sha256sums=('SKIP'
            '774d21c2b87b2c54a1b8d4f868d9d21649642f86652f8057e24771a2b06b41ba'
            '5a251975f3364587d7802d21a9b843a4664d88c76074af832108b2ae6272c7e3')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_gitname}"
    git reset --hard master  # to clean up previous patch attempts

    for patch in ../*.patch; do
        git apply $patch
    done
}

build() {
    cd "${_gitname}"
    make clean
    make
}

package() {
    cd "${_gitname}"
    install -Dm 755 dpcmd "$pkgdir"/usr/bin/dpcmd
}
