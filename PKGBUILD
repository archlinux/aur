# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uvg266-git
pkgver=0.8.0.r1.ge5e32d67
pkgrel=1
pkgdesc='An open-source VVC encoder (git version)'
arch=('x86_64')
url='https://github.com/ultravideo/uvg266/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
checkdepends=('ffmpeg' 'python' 'vvc-vtm')
BUILDENV+=('!check')
source=('git+https://github.com/ultravideo/uvg266.git'
        'git+https://github.com/ultravideo/greatest.git'
        '010-uvg266-rename-vtm-decoder.patch'
        '020-uvg266-disable-uvg266-tests.patch')
sha256sums=('SKIP'
            'SKIP'
            '7e262c2e95a33c1098187a2bb113c01dedc033fd96ceeed87e7aca6d2c57f5df'
            'c86cfb280a6217bfebb04581ac188bd5625003fcefdeb146b72fb9758a573aad')

prepare() {
    git -C uvg266 submodule init
    git -C uvg266 config --local submodule.greatest.url "${srcdir}/greatest"
    git -C uvg266 -c protocol.file.allow='always' submodule update
    patch -Np1 -d uvg266 -i "${srcdir}/010-uvg266-rename-vtm-decoder.patch"
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
    make -C build
}

check() {
    # ctest --test-dir build --output-on-failure
    ln -s ../../build/uvg266 uvg266/bin/uvg266
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 uvg266/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
