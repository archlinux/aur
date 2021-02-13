# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=svt-av1-git
pkgver=0.8.6.r77.gd5a40d53
pkgrel=2
pkgdesc='Scalable Video Technology AV1 encoder and decoder (git version)'
arch=('x86_64')
url='https://gitlab.com/AOMediaCodec/SVT-AV1/'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-av1')
conflicts=('svt-av1')
source=('git+https://gitlab.com/AOMediaCodec/SVT-AV1.git')
sha256sums=('SKIP')

pkgver() {
    git -C SVT-AV1 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S SVT-AV1 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
