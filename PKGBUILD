# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=svt-av1-git
pkgver=0.8.0.r23.gba3dd448
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder (git version)'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-AV1/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'nasm')
provides=('svt-av1')
conflicts=('svt-av1')
source=('git+https://github.com/OpenVisualCloud/SVT-AV1.git')
sha256sums=('SKIP')

pkgver() {
    cd SVT-AV1
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S SVT-AV1 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 SVT-AV1/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
