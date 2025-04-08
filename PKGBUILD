# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=svt-jpeg-xs-git
pkgver=0.9.0.r5.ge0940ac
pkgrel=1
pkgdesc='An implementation of the JPEG XS (ISO/IEC 21122) codec (git version)'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-JPEG-XS/'
license=('BSD-2-Clause-Patent')
depends=('glibc')
makedepends=('cmake' 'git' 'yasm')
provides=('svt-jpeg-xs')
conflicts=('svt-jpeg-xs')
source=('git+https://github.com/OpenVisualCloud/SVT-JPEG-XS.git'
        '010-svt-jpeg-xs-remove-werror.patch')
sha256sums=('SKIP'
            '27e8899b11dc3466d9b060571b51d38524e1cfc89f7552e7c8ada3d1a3035dbc')

prepare() {
    patch -d SVT-JPEG-XS -Np1 -i "${srcdir}/010-svt-jpeg-xs-remove-werror.patch"
}

pkgver() {
    git -C SVT-JPEG-XS describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    cmake -B build -S SVT-JPEG-XS \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 SVT-JPEG-XS/LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
}
