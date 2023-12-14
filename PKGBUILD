# Maintainer : Owen Quinlan <hello@buymymojo.net>

pkgname=svt-av1-bluesword-git
pkgver=0.8.6.r1446.g4aa74956
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder (BlueSword fork)'
arch=('x86_64')
url='https://github.com/BlueSwordM/SVT-AV1'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-av1')
conflicts=('svt-av1')
source=('git+https://github.com/BlueSwordM/SVT-AV1.git')
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
