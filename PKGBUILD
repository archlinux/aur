# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uvg266-git
pkgver=0.8.1.r332.g391a5642
pkgrel=1
pkgdesc='An open-source VVC encoder (git version)'
arch=('x86_64')
url='https://github.com/ultravideo/uvg266/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
#checkdepends=('ffmpeg' 'python' 'vvc-vtm')
provides=('uvg266')
conflicts=('uvg266')
source=('git+https://github.com/ultravideo/uvg266.git'
        'git+https://github.com/ultravideo/greatest.git'
        '010-uvg266-tests-rename-vtm-decoder.patch'
        '020-uvg266-disable-uvg266-tests.patch')
sha256sums=('SKIP'
            'SKIP'
            '7e262c2e95a33c1098187a2bb113c01dedc033fd96ceeed87e7aca6d2c57f5df'
            'c5563ea2f3ecb673f5b5234f99daa6e14f5e320d8ca299f548d6b7c5cedfeab2')

prepare() {
    git -C uvg266 submodule init
    git -C uvg266 config --local submodule.greatest.url "${srcdir}/greatest"
    git -C uvg266 -c protocol.file.allow='always' submodule update
    #patch -Np1 -d uvg266 -i "${srcdir}/010-uvg266-tests-rename-vtm-decoder.patch"
    #patch -Np1 -d uvg266 -i "${srcdir}/020-uvg266-disable-uvg266-tests.patch"
}

pkgver() {
    git -C uvg266 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S uvg266 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:STRING='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

#check() {
#    ln -s ../../build/uvg266 uvg266/bin/uvg266
#    make -C build test
#}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 uvg266/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
