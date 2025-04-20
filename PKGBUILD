# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
pkgver=1.5.4.r31.g952f9495
pkgrel=1
pkgdesc='Secure Reliable Transport - transport protocol for ultra low latency live video and audio streaming (git version)'
arch=('x86_64')
url='https://www.srtalliance.org/'
license=('MPL-2.0')
depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'openssl')
makedepends=(
    'cmake'
    'git')
provides=('srt')
conflicts=('srt')
source=('git+https://github.com/Haivision/srt.git')
sha256sums=('SKIP')

pkgver() {
    git -C srt describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)\./rc/'
}

build() {
    cmake -B build -S srt \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DENABLE_STATIC:BOOL='OFF' \
        -DENABLE_TESTING:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    build/uriparser-test
    build/utility-test
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
