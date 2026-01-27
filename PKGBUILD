# Maintainer: Evert Vorster
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgname=wine-nvcuda-git
pkgver=0.3.r3.gd04095b
pkgrel=1
pkgdesc='Standalone version of nvcuda from Wine-Staging (git)'
arch=('x86_64')
url='https://github.com/SveSop/nvcuda'
license=('LGPL-2.1-or-later')
depends=('glibc' 'wine>=10.0')
makedepends=('git' 'meson' 'ninja')
provides=('wine-nvcuda')
conflicts=('wine-nvcuda')
options=('!strip')
source=('git+https://github.com/SveSop/nvcuda.git')
b2sums=('SKIP')

pkgver() {
    git -C "${srcdir}/nvcuda" describe --tags | sed -E 's/^v//;s/-([0-9]+)-/-r\1-/;s/-/./g'
}

build() {
    cd "${srcdir}/nvcuda"

    meson setup \
        --cross-file ./build-wine64.txt \
        --prefix /usr \
        --libdir lib \
        --buildtype release \
        --strip \
        -D fakedll=true \
        ../build-wine64 .

    ninja -C ../build-wine64
}

package() {
    depends+=('nvidia-utils')

    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build-wine64" install
}
