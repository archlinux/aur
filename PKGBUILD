# Maintainer: Lukas Weber <laochailan web de>
# Contributor: Emmanuel Gil Peyrot <linkmauve linkmauve fr>
# Contributor: Andrei Alexeyev <akari alienslab net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=taisei-git
pkgver=1.4.r696.gc91d3d1ab
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'sdl3' 'cglm' 'libunibreak' 'freetype2' 'libwebp' 'zlib' 'zstd' 'opusfile' 'hicolor-icon-theme' 'mimalloc')
optdepends=('spirv-cross: OpenGL ES backends'
            'shaderc: OpenGL ES backends'
            'gamemode: GameMode integration'
            'openssl: for a better SHA-256 implementation')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson' 'python-docutils')
source=('git+https://github.com/taisei-project/taisei.git'
        'git+https://github.com/taisei-project/SDL_GameControllerDB.git'
        'git+https://github.com/taisei-project/python-zipfile-zstd.git'
        'git+https://github.com/taisei-project/koishi.git'
        'git+https://github.com/taisei-project/basis_universal.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd taisei
    git describe --long --tags --match "v[0-9]*[!a-z]" | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd taisei
    git submodule init
    git config submodule.gamecontrollerdb.url "$srcdir/SDL_GameControllerDB"
    git config submodule.external/koishi.url "$srcdir/koishi"
    git config submodule.external/python-zipfile-zstd.url "$srcdir/python-zipfile-zstd"
    git config submodule.external/basis_universal.url "$srcdir/basis_universal"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd taisei

    arch-meson . build \
            -Dinstall_macos_bundle=disabled \
            -Dinstall_relocatable=disabled \
            -Dr_gles30=disabled \
            -Dshader_transpiler=disabled \
            -Dshader_transpiler_dxbc=disabled
    meson compile -C build
}

package() {
    cd taisei
    DESTDIR="$pkgdir/" meson install -C build
    install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
