# Maintainer: Lukas Weber <laochailan web de>
# Contributor: Emmanuel Gil Peyrot <linkmauve linkmauve fr>
# Contributor: Andrei Alexeyev <akari alienslab net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=taisei-git
pkgver=1.3.r1132.ga5678791
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'sdl2' 'cglm' 'freetype2' 'libwebp' 'libzip' 'zstd' 'opusfile' 'hicolor-icon-theme')
optdepends=('spirv-cross: OpenGL ES backends'
            'shaderc: OpenGL ES backends'
            'gamemode: GameMode integration'
            'openssl: for a better SHA-256 implementation')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson' 'python-docutils' 'python-zstandard')
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
    meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --wrap-mode nodownload -D b_lto=true -D b_pie=true build
    meson compile -C build
}

package() {
    cd taisei
    DESTDIR="$pkgdir/" meson install -C build
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
