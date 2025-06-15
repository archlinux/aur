# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uvg266
pkgver=0.8.1
pkgrel=3
pkgdesc='An open-source VVC encoder'
arch=('x86_64')
url='https://github.com/ultravideo/uvg266/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
#checkdepends=('ffmpeg' 'python' 'vvc-vtm')
source=("git+https://github.com/ultravideo/uvg266.git#tag=v${pkgver}"
        'git+https://github.com/ultravideo/greatest.git'
        '010-uvg266-tests-rename-vtm-decoder.patch'
        '020-uvg266-disable-uvg266-tests.patch'
        '030-uvg266-gcc15-fix.patch'::'https://github.com/ultravideo/uvg266/commit/bc6b9d9a14710c5dfa0d7a3b92983dbe6b1d7c5d.patch')
sha256sums=('f3a0de4b073e8fd8172d10617e640989928e0da8bec7727b35e41953fd85a40d'
            'SKIP'
            '7e262c2e95a33c1098187a2bb113c01dedc033fd96ceeed87e7aca6d2c57f5df'
            'c86cfb280a6217bfebb04581ac188bd5625003fcefdeb146b72fb9758a573aad'
            '195b6364621aaccb4345198c7a2f63240be51fb5c6ebad6b50608fb1fc6b414d')

prepare() {
    git -C uvg266 submodule init
    git -C uvg266 config --local submodule.greatest.url "${srcdir}/greatest"
    git -C uvg266 -c protocol.file.allow='always' submodule update
    #patch -Np1 -d uvg266 -i "${srcdir}/010-uvg266-tests-rename-vtm-decoder.patch"
    #patch -Np1 -d uvg266 -i "${srcdir}/020-uvg266-disable-uvg266-tests.patch"
    patch -Np1 -d uvg266 -i "${srcdir}/030-uvg266-gcc15-fix.patch"
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
