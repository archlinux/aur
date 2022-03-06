pkgname=matsurika
pkgver=v1.20.0.r63.ge7cfcb1b
pkgrel=1
pkgdesc="Fork of the janet programming language"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://github.com/eshrh/matsurika"
license=('GPL')
depends=()
makedepends=('git')
provides=('matsurika')
conflicts=('janet-lang' 'janet-lang-bin' 'janet-lang-git')
source=("git+https://github.com/eshrh/matsurika.git")
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
    cd "${srcdir}/$pkgname"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
    cd "${srcdir}/${pkgname}"
    CFLAGS+=" -fPIC"
    LDFLAGS+=" -rdynamic"
    make PREFIX="/usr" -j7
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dt       "${pkgdir}"/usr/bin build/matsurika
    install -Dm644 -t "${pkgdir}"/usr/include/janet build/janet.h
    install -Dm644 -t "${pkgdir}"/usr/lib build/libjanet.a build/libjanet.so
    ln -s libjanet.so "${pkgdir}"/usr/lib/libjanet.so.$pkgver
}
