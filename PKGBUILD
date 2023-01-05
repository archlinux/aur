# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uvg266
pkgver=0.4.1
pkgrel=1
pkgdesc='An open-source VVC encoder'
arch=('x86_64')
url='https://github.com/ultravideo/uvg266/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
checkdepends=('ffmpeg' 'python' 'vvc-vtm')
source=("git+https://github.com/ultravideo/uvg266.git#tag=v${pkgver}"
        'git+https://github.com/ultravideo/greatest.git'
        '010-uvg266-rename-vtm-decoder.patch'
        '020-uvg266-disable-uvg266-tests.patch')
sha256sums=('SKIP'
            'SKIP'
            '7e262c2e95a33c1098187a2bb113c01dedc033fd96ceeed87e7aca6d2c57f5df'
            '85aca48926abfd9dc15c034e108e4da5563708c17a48d04f97b2e3503cd3405f')

prepare() {
    git -C uvg266 submodule init
    git -C uvg266 config --local submodule.greatest.url "${srcdir}/greatest"
    git -C uvg266 -c protocol.file.allow='always' submodule update
    patch -Np1 -d uvg266 -i "${srcdir}/010-uvg266-rename-vtm-decoder.patch"
    patch -Np1 -d uvg266 -i "${srcdir}/020-uvg266-disable-uvg266-tests.patch"
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
    ln -s ../../build/uvg266 uvg266/bin/uvg266
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 uvg266/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
