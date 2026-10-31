# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=svt-jpeg-xs-git
pkgver=0.10.0.r0.g01bc7cc
pkgrel=1
pkgdesc='An implementation of the JPEG XS (ISO/IEC 21122) codec (git version)'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-JPEG-XS/'
license=('BSD-2-Clause-Patent')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'git'
    'yasm')
provides=('svt-jpeg-xs')
conflicts=('svt-jpeg-xs')
source=('git+https://github.com/OpenVisualCloud/SVT-JPEG-XS.git'
        '010-svt-jpeg-xs-remove-werror.patch')
sha256sums=('SKIP'
            'cd095dfd29cc2bdc5ca5e0bb21decad57793c1f17ac4dc5739473c1a4eb8b05c')

prepare() {
    patch -d SVT-JPEG-XS -Np1 -i "${srcdir}/010-svt-jpeg-xs-remove-werror.patch"
}

pkgver() {
    git -C SVT-JPEG-XS describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S SVT-JPEG-XS \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE:BOOL='OFF' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 SVT-JPEG-XS/LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
}
