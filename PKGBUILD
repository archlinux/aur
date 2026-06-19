# Maintainer: FinleyLaempe <finley.laempe@web.de>
pkgname=judoshiai
pkgver=4.4.1
pkgrel=1
pkgdesc="A set of programs to help organize a judo tournament (latest stable release)"
arch=('x86_64')
url="https://www.judoshiai.org"
license=('custom')
depends=(
    'libao' 'cairo' 'curl' 'gdk-pixbuf2' 'gtk3' 'pango' 'librsvg'
    'libssh2' 'libuv' 'gnutls' 'mpg123' 'libxml2-legacy' 'lua' 'libcap'
    'p11-kit' 'openssl'
)
makedepends=('git' 'cmake' 'bison' 'flex' 'pkgconf' 'gcc' 'make' 'gettext')
provides=('judotimer' 'judoinfo' 'judoweight' 'judojudogi')
conflicts=('judoshiai-git')
# VCS source: AUR helpers run with --devel will re-fetch and rebuild, picking
# up any newly published stable tag automatically (see prepare/pkgver).
source=("judoshiai-src::git+https://git.code.sf.net/p/judoshiai/judoshiai")
sha256sums=('SKIP')

# Newest stable tag = highest `version-X[.Y[.Z]]` (pre-release suffixes like
# `4.0a` or `2.4beta10` are excluded by the numeric-only regex).
_latest_stable_tag() {
    git -C "$srcdir/judoshiai-src" tag -l 'version-*' \
        | grep -E '^version-[0-9]+(\.[0-9]+)*$' \
        | sort -V | tail -1
}

pkgver() {
    cd "$srcdir/judoshiai-src"
    git describe --tags --abbrev=0 | sed 's/^version-//'
}

prepare() {
    cd "$srcdir/judoshiai-src"

    # Track the newest stable tag automatically. Runs before pkgver(), so the
    # reported version always matches the checked-out tag.
    local tag
    tag=$(_latest_stable_tag)
    [[ -n $tag ]] || { echo "no stable tag found" >&2; return 1; }
    msg2 "Building stable tag: $tag"
    git checkout -f "$tag"

    # Lua: code expects /usr/include/lua5.4 + -llua5.4. Arch ships plain lua.
    mkdir -p "$srcdir/lua-shim/include/lua5.4" "$srcdir/lua-shim/lib"
    for h in lua.h lualib.h lauxlib.h luaconf.h; do
        ln -sf "/usr/include/$h" "$srcdir/lua-shim/include/lua5.4/$h"
    done
    ln -sf /usr/lib/liblua.so "$srcdir/lua-shim/lib/liblua5.4.so"

    # gcc >=15 default C23: bool/true/false are reserved. 3rdparty/QRCode
    # still does `typedef unsigned char bool; static const bool false=0;`.
    # Replace with <stdbool.h>.
    sed -i \
        -e 's|^typedef unsigned char bool;$|#include <stdbool.h>|' \
        -e '/^static const bool false = 0;$/d' \
        -e '/^static const bool true = 1;$/d' \
        3rdparty/QRCode/src/qrcode.h

    # cmake >=4 dropped policy compat <3.5. Vendored libwebsockets needs bump.
    sed -i 's|cmake_minimum_required *(VERSION [0-9.]*)|cmake_minimum_required(VERSION 3.5)|I' \
        3rdparty/libwebsockets/CMakeLists.txt

    # basic.tab.o (yacc/bison output) uses exp() → need -lm. Upstream Makefile
    # omits it on Linux. Append to LIBS line that ends with `-lssh2 -ldl`.
    sed -i 's/-lssh2 -ldl$/-lssh2 -ldl -lm/' mk/linux.mk
}

build() {
    cd "$srcdir/judoshiai-src"
    # mk/linux.mk uses `JS_BUILD_DIR=/home/$USER/js-build` (hard assignment),
    # so we must pass it as a make argument to override.
    local -a mk=(JS_BUILD_DIR="$srcdir/js-build")
    # gcc >=15 defaults to C23 where bool/true/false are keywords; 3rdparty
    # qrcode.h still does `typedef unsigned char bool;`. Force gnu17.
    export CFLAGS="${CFLAGS} -std=gnu17 -I$srcdir/lua-shim/include -Wno-deprecated-declarations"
    export LDFLAGS="${LDFLAGS} -L$srcdir/lua-shim/lib"

    # Build the subdirs we actually ship. Skip flutter, doc (libreoffice),
    # judoproxy, judohttpd, auto-update; the root Makefile's `all` target
    # also runs broken cp-from-$RUNDIR steps and we don't need them.
    make "${mk[@]}" -C common locale
    make "${mk[@]}" -C judoshiai
    make "${mk[@]}" -C judotimer
    make "${mk[@]}" -C judoinfo
    make "${mk[@]}" -C judoweight
    make "${mk[@]}" -C judojudogi
    make "${mk[@]}" -C utils
}

package() {
    cd "$srcdir/judoshiai-src"
    local obj="obj-linux"
    local libdir="$pkgdir/usr/lib/judoshiai"

    # Binaries land in /usr/lib/judoshiai/bin (rpath = 'bin' relative)
    install -dm755 "$libdir/bin"
    install -m755 "$srcdir/js-build/judoshiai/$obj/judoshiai"   "$libdir/bin/"
    install -m755 "$srcdir/js-build/judotimer/$obj/judotimer"   "$libdir/bin/"
    install -m755 "$srcdir/js-build/judoinfo/$obj/judoinfo"     "$libdir/bin/"
    install -m755 "$srcdir/js-build/judoweight/$obj/judoweight" "$libdir/bin/"
    install -m755 "$srcdir/js-build/judojudogi/$obj/judojudogi" "$libdir/bin/"
    install -m755 "$srcdir/js-build/utils/$obj/db-convert"      "$libdir/bin/"

    # Resource trees
    cp -a etc            "$libdir/"
    cp -a svg            "$libdir/"
    cp -a svg-lisp       "$libdir/"
    cp -a svg-lua        "$libdir/"
    cp -a custom-examples "$libdir/"
    cp -a share          "$libdir/" 2>/dev/null || true

    # Translations (.mo built by common/Makefile locale target)
    declare -A langs=(
        [fi]=fi_FI [sv]=sv_SE [es]=es_ES [et]=et_EE [uk]=uk_UA [is]=is_IS
        [nb]=nb_NO [pl]=pl_PL [sk]=sk_SK [nl]=nl_NL [cs]=cs_CZ [de]=de_DE
        [da]=da_DK [he]=he_IL [fr]=fr_FR [fa]=fa_IR [en_CA]=en_CA
        [fr_CA]=fr_CA [en_US]=en_US [it]=it_IT
    )
    for dir in "${!langs[@]}"; do
        local src="common/judoshiai-${langs[$dir]}.mo"
        [[ -f $src ]] || continue
        install -Dm644 "$src" "$pkgdir/usr/share/locale/$dir/LC_MESSAGES/judoshiai.mo"
    done

    # /usr/bin launchers
    install -dm755 "$pkgdir/usr/bin"
    for b in judoshiai judotimer judoinfo judoweight judojudogi; do
        ln -sf "/usr/lib/judoshiai/bin/$b" "$pkgdir/usr/bin/$b"
    done

    # Desktop + icons + mime
    install -dm755 "$pkgdir/usr/share/applications" \
                   "$pkgdir/usr/share/pixmaps" \
                   "$pkgdir/usr/share/icons/hicolor/48x48/apps" \
                   "$pkgdir/usr/share/mime/packages"
    for d in judoshiai judotimer judoinfo judoweight judojudogi; do
        install -m644 "gnome/$d.desktop" "$pkgdir/usr/share/applications/"
        install -m644 "etc/png/$d.png"   "$pkgdir/usr/share/pixmaps/"
        install -m644 "etc/png/$d.png"   "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
    done
    install -m644 gnome/judoshiai.xml "$pkgdir/usr/share/mime/packages/"

    # Licenses
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 licenses/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -a licenses/* "$libdir/" 2>/dev/null || true

    # lua5.4 runtime soname alias (binary linked against liblua5.4.so.0)
    install -dm755 "$pkgdir/usr/lib"
    ln -sf /usr/lib/liblua.so "$pkgdir/usr/lib/liblua5.4.so.0"
}
