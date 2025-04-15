# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: nyorain <nyorain at gmail dot com>

pkgname=('skia-git')
pkgver=r74476.5b56d9a916
pkgrel=1
pkgdesc="A complete 2D graphic library for drawing Text, Geometries, and Images."
arch=('x86_64')
url="https://github.com/google/skia"
license=('BSD-3-Clause')
depends=('zlib' 'libglvnd' 'freetype2' 'expat' 'libpng' 'libjpeg-turbo' 'fontconfig' 'harfbuzz' 'gcc-libs' 'libwebp' 'glibc')
makedepends=('git' 'rsync' 'python' 'procps-ng' 'ninja' 'depot-tools-git')
provides=(skia)
conflicts=(skia)
pkgver() {
    cd "$srcdir/skia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#TODO:
# skia-git W: ELF file ('usr/lib/libskia.so') lacks FULL RELRO, check LDFLAGS.
# use system gn, if even possible...
# try not to use rsync
# recheck deps + makedeps

prepare() {
    # to make sure depot tools are in path
    cd "$srcdir"
    SRC_DIR="$(readlink -f "$srcdir")"
        rsync -Pa /opt/depot_tools/ "$SRC_DIR/depot_tools/"

    export PATH="$SRC_DIR/depot_tools:$PATH"


    # download/sync skia
    cd "$srcdir"
    gclient config https://skia.googlesource.com/skia.git < <(yes)
    gclient sync < <(yes)
    gclient runhooks < <(yes)

    # generate the ninja build files using gn
    cd skia
    tools/git-sync-deps
    bin/gn gen out/Debug --args='is_official_build=true is_component_build=true'
}

build() {
    cd skia
    export PATH="$srcdir/depot_tools:$PATH"
    ninja -C ./out/Debug
}

package() {
    cd "$srcdir/skia"

    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Library
    install -D -m644 out/Debug/libskia.so "$pkgdir/usr/lib/libskia.so"

    # Headers
    find include -type f -and -name "*.h" -exec install -v -D -m644 {} "$pkgdir/usr/include/"{} \; -print
    find modules -type f -and -name "*.h" -exec install -v -D -m644 {} "$pkgdir/usr/include/"{} \; -print
    find src -type f -and -name "*.h" -exec install -v -D -m644 {} "$pkgdir/usr/include/"{} \; -print
}

