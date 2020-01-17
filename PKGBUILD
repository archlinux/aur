# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=svt-vp9-git
pkgver=0.1.0.r6.g420f9f3
pkgrel=1
pkgdesc='Scalable Video Technology VP9 encoder (git version)'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-VP9/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'nasm')
provides=('svt-vp9')
conflicts=('svt-vp9')
source=('git+https://github.com/OpenVisualCloud/SVT-VP9.git')
sha256sums=('SKIP')

pkgver() {
    cd SVT-VP9
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    cmake -B build -S SVT-VP9 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 SVT-VP9/LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
}
