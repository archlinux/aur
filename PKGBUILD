# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: nyorain <nyorain at gmail dot com>

pkgname=('skia-git')
pkgver=r73166.0b776ce0b8
pkgrel=1
pkgdesc="Chromiums high-performance rendering library"
arch=('x86_64')
url="https://github.com/google/skia"
license=('BSD')
depends=('zlib' 'libglvnd' 'freetype2' 'expat' 'libpng' 'libjpeg-turbo' 'fontconfig' 'harfbuzz' 'gcc-libs' 'libwebp' 'glibc')
makedepends=('git' 'rsync' 'python' 'procps-ng' 'ninja' 'depot-tools-git')
pkgver() {
    cd "$srcdir/skia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#TODO:
# skia-git W: ELF file ('usr/lib/libskia.so') lacks FULL RELRO, check LDFLAGS.
# use system gn
# try not to use rsync
# clean up package()
# recheck deps + makedeps

prepare() {
    # to make sure depot tools are in path
    cd "$srcdir"
    SRC_DIR="$(readlink -f "$srcdir")"
#    [ ! -d "/opt/depot_tools/.git" ] && {
#        tput bold
#        echo $'depot_tools not found, cloning just for this AUR build of Skia!!!\nSee https://aur.archlinux.org/packages/depot-tools-git#comment-941904'
#        tput sgr0
#        [ -d ./depot_tools ] && {
#            pushd depot_tools
#            git switch main
#            git pull
#            popd
#        } || {
#            git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
#        }
#    } || {
        rsync -Pa /opt/depot_tools/ "$SRC_DIR/depot_tools/"
#    }

    export PATH="$SRC_DIR/depot_tools:$PATH"

    #git config --global --add safe.directory /opt/depot_tools

    # download/sync skia
    cd "$srcdir"
    gclient config https://skia.googlesource.com/skia.git < <(yes)
    gclient sync < <(yes)
    gclient runhooks < <(yes)

    # generate the ninja build files using gn
    cd skia
    tools/git-sync-deps
    gn gen out/Debug --args='is_official_build=true is_component_build=true'
}

build() {
    cd skia
    export PATH="$srcdir/depot_tools:$PATH"
    ninja -C ./out/Debug
}

package() {
    local cxxfindheaders='-type f -and -( -name "*.h" -or -name "*.hh" -or -name "*.hpp" -or -name "*.hxx" -or -name "*.inc" -)'
    cd "$srcdir/skia"

    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Library
    install -D -m644 out/Debug/libskia.so "$pkgdir/usr/lib/libskia.so"

    # Headers
    find include $cxxfindheaders \
        -exec install -v -D -m644 {} "$pkgdir/usr/include/skia/"{} \; -print
}

