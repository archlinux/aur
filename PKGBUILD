# Maintainer: Evert Vorster
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgname=wine-nvoptix-git
pkgver=0.3.r7.gc14b55a
pkgrel=1
pkgdesc='Relay for nvoptix to use with Wine (git)'
arch=('x86_64')
url='https://github.com/SveSop/wine-nvoptix'
license=('MIT')
depends=('glibc' 'wine>=10.0')
makedepends=('git' 'meson' 'ninja')
provides=('wine-nvoptix')
conflicts=('wine-nvoptix')
options=('!strip')
source=('git+https://github.com/SveSop/wine-nvoptix.git')
b2sums=('SKIP')

pkgver() {
    git -C "${srcdir}/wine-nvoptix" describe --tags | sed -E 's/^v//;s/-([0-9]+)-/-r\1-/;s/-/./g'
}

build() {
    cd "${srcdir}/wine-nvoptix"

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

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
        "${srcdir}"/wine-nvoptix/{COPYING.LIB,LICENSE}
}
