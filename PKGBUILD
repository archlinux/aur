# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=hawktracer-git
_srcname=hawktracer
pkgver=0.6.0.r59.ga90df7a
pkgrel=1
pkgdesc='HawkTracer - a highly portable, low-overhead, configurable profiling tool (git version)'
arch=('i686' 'x86_64')
url='https://github.com/loganek/hawktracer'
license=('MIT')
makedepends=('git' 'cmake')
provides=('hawktracer')
conflicts=('hawktracer')
source=('git+https://github.com/loganek/hawktracer.git'
        '0001-build-Install-examples-into-DOC-directory.patch')
sha512sums=('SKIP'
            'b600931bb8e0ff40e6a4a16e80e7e32881f57491fc8bec8658cd863f3b42e3b73ee4c95912adaa0489b41df7681d9e7820b92b4601bcfaa7573b7578faa4b692')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$_srcname"
    patch -Np1 < ${srcdir}/0001-build-Install-examples-into-DOC-directory.patch
}

build() {
    cd "$_srcname"
    
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        ..

    cmake --build .
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
