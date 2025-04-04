# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=brunsli-git
pkgver=0.1.r85.gcbbc39a
pkgrel=2
pkgdesc='Lossless JPEG repacker (git version)'
arch=('x86_64')
url='https://github.com/google/brunsli/'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'python')
provides=('brunsli')
conflicts=('brunsli')
source=('git+https://github.com/google/brunsli.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/brotli.git'
        '010-brunsli-use-local-sources-for-dependencies.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a3e576154381db0774ef46c41f603ad8c6699239dd8a4d9fff4e712aa87547f4')

prepare() {
    git -C googletest config --local advice.detachedHead false
    git -C brotli config --local advice.detachedHead false
    
    git -C googletest checkout "$(awk '/GIT_TAG/ { print $2; exit; }' brunsli/CMakeLists.txt)"
    git -C brotli checkout "$(awk '/GIT_TAG/ { a=$2 } END { print a }' brunsli/CMakeLists.txt)"
    
    patch -d brunsli -Np1 -i "${srcdir}/010-brunsli-use-local-sources-for-dependencies.patch"
}

pkgver() {
    git -C brunsli describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S brunsli \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING="3.5.0" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 build/{cbrunsli,dbrunsli} -t "${pkgdir}/usr/bin"
    install -D -m644 brunsli/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
