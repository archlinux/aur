# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd-git
pkgver=0.7.0.r0.g0f066b3
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder (git version)'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'git')
provides=('xevd')
conflicts=('xevd')
options=('!emptydirs')
source=('git+https://github.com/mpeg5/xevd.git'
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch')
sha256sums=('SKIP'
            'a7a22d26772657046475b1e664cbab3331355aef847f51bbb74d0bede25462f2'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a')

prepare() {
    patch -d xevd -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d xevd -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
}

pkgver() {
    git -C xevd describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S xevd \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DXEVD_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 xevd/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xevd/libxevd.a"
}
