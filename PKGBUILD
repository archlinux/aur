# Maintainer: Evert Vorster
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgname=wine-nvenc-git
pkgver=r24.09ec9e1
pkgrel=1
pkgdesc='Standalone version of nvencodeapi and nvcuvid for Wine (git)'
arch=('x86_64')
url='https://github.com/SveSop/nvenc'
license=('LGPL-2.1-or-later')
depends=('glibc' 'wine>=10.0')
makedepends=('git' 'meson' 'ninja')
provides=('wine-nvenc')
conflicts=('wine-nvenc')
options=('!strip')
source=('git+https://github.com/SveSop/nvenc.git')
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/nvenc"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/nvenc"

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
    depends+=('nvidia-utils' 'wine-nvcuda')

    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build-wine64" install
}
