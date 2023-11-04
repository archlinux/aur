#!/bin/hint/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: nyorain <nyorain at gmail dot com>

pkgbase=skia-git
pkgname=('skia-git' 'skia-examples-git')
pkgver=r69268.77aeee3b81
pkgrel=1
pkgdesc="Chromiums high-performance rendering library (static)"
arch=('any')
url="https://github.com/google/skia"
license=('BSD')
depends=('mesa' 'libgl')
makedepends=('git' 'ninja' 'python2' 'gcc' 'gn')
makedepends+=('rsync')
optdepends=('depot-tools-git: for building with system-wide depot-tools, requires patching the PKGBUILD')

pkgver() {
    cd "$srcdir/skia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # to make sure depot tools are in path
    cd "$srcdir"
    SRC_DIR="$(readlink -f "$srcdir")"
    [ ! -d "/opt/depot_tools/.git" ] && {
        warning $'depot_tools not found, cloning just for this AUR build of Skia!!!\nSee https://aur.archlinux.org/packages/depot-tools-git#comment-941904'
        [ -d ./depot_tools ] && {
            pushd depot_tools
            git switch main
            git pull
            popd
        } || {
            git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
        }
    } || {
        rsync -Pa /opt/depot_tools/ "$SRC_DIR/depot_tools/"
    }

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
    gn gen out/Debug
}

build() {
    cd skia
    export PATH="$srcdir/depot_tools:$PATH"
    ninja -C ./out/Debug
}

package_skia-git() {
    local cxxfindheaders='-type f -and -( -name "*.h" -or -name "*.hh" -or -name "*.hpp" -or -name "*.hxx" -or -name "*.inc" -)'
    cd "$srcdir/skia"
    
    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Static library
    install -D -m644 out/Debug/libskia.a "$pkgdir/usr/lib/libskia.a"

    # Headers
    find include $cxxfindheaders \
        -exec install -v -D -m644 {} "$pkgdir/usr/include/skia/"{} \; -print

    # Headers (generated)
    pushd out/Debug
    pushd gen
    find . $cxxfindheaders \
        -exec install -v -D -m644 {} "$pkgdir/usr/include/skia/"{} \; -print
}

build_skia-examples-git() {
    makedepends+=('parallel' 'upx')
}

package_skia-examples-git() {
    pkgdesc="${pkgdesc%% (static)} (examples)"
    depends+=(glu libx11 libxrandr libxinerama libxcursor libxi libxcomposite libxdamage libxext libxfixes libxrender libxkbcommon-x11)
    cd "$srcdir/skia"
    pushd out/Debug
    find . -executable -type f -exec install -v -D -m755 {} "$pkgdir/usr/bin/skia/{}" \; -print
    pushd "$pkgdir/usr/bin/skia"
    parallel --bar upx -7 {} ::: *
}

# vim:set ts=4 sw=4 et syntax=bash:
