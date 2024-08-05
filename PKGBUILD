# Maintainer: Zeno Sebastian Endemann <zeno.endemann@mailbox.org>

pkgname=mapla
pkgver=20240805
pkgrel=1
pkgdesc='Example Alpe audio stream server'
arch=('x86_64')
url='https://gitlab.com/z-s-e/mapla'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake')
optdepends=('realtime-privileges: allow realtime operation')
source=('git+https://gitlab.com/z-s-e/mapla.git#commit=0ef77b7136ee92dd3f5c9e6e80fe7c06f794bb4b'
        'git+https://gitlab.com/z-s-e/alpe.git'
        'git+https://github.com/z-s-e/lbu.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd ${pkgname}
    git submodule init
    git config submodule.deps/alpe.url "$srcdir/alpe"
    git config submodule.deps/lbu.url "$srcdir/lbu"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake \
        -G 'Unix Makefiles' \
        -B "${pkgname}-${pkgver}-build" \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build "${pkgname}-${pkgver}-build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}-build"
}
