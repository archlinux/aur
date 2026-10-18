# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>

pkgname=vexa-git
pkgver=r125.g4d6c59d
pkgrel=2
pkgdesc="Modern cross-platform graphics framework in C++"
arch=('x86_64')
url="https://github.com/monjaris/vexa"
license=('MIT')

makedepends=('git' 'xmake')
provides=('vexa')

source=('vexa::git+https://github.com/monjaris/vexa.git'
        'vexa-export-tfmt-symbols.patch')
sha256sums=('SKIP'
            'b26f6da2f0e1c0bb29e0db763428c921f64b9e96fdea3e1d89beadbb0e546606')

prepare() {
    cd "$srcdir/vexa"

    # export tiny-fmt's ABI from libvexa.so: without this, release builds
    # compile tiny-fmt (static) with -fvisibility=hidden, so consumers of
    # vexa/core/log.hpp fail to link against tfmt::v12::vprint;
    # drop this patch once vexa master carries the fix
    patch -Np1 -i "$srcdir/vexa-export-tfmt-symbols.patch"
}

pkgver() {
    cd "$srcdir/vexa"

    printf "r%s.g%s\n" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/vexa"

    ./build.sh
}

package() {
    cd "$srcdir/vexa"

    # the real file carries DT_SONAME libvexa.so.0 (once vexa's
    # set_version/soname rule is on master); libvexa.so is the dev symlink
    # the linker uses via -lvexa
    install -Dm755 libvexa.so "$pkgdir/usr/lib/libvexa.so.0"
    ln -s libvexa.so.0 "$pkgdir/usr/lib/libvexa.so"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/vexa-git/LICENSE.txt"

    # public headers, source-tree layout preserved: /usr/include/vexa/...
    cp -r include "$pkgdir/usr/"

    # vendored headers, layout preserved so the relative includes in
    # include/vexa/alt/*.hpp ("../vendor/...") keep resolving after install;
    # vendored SDL3/SDL3_ttf/tiny-fmt must never clash with distro sdl3
    # packages, which own /usr/include/SDL3 and /usr/include/SDL3_ttf
    install -d "$pkgdir/usr/include/vexa/vendor/tiny-fmt" \
               "$pkgdir/usr/include/vexa/vendor/SDL3" \
               "$pkgdir/usr/include/vexa/vendor/SDL3_ttf"
    cp -r vendor/tiny-fmt/include "$pkgdir/usr/include/vexa/vendor/tiny-fmt/"
    cp -r vendor/SDL3/include     "$pkgdir/usr/include/vexa/vendor/SDL3/"
    cp -r vendor/SDL3_ttf/include "$pkgdir/usr/include/vexa/vendor/SDL3_ttf/"

    # pkg-config; the vendor -I paths are required because SDL3 and SDL3_ttf
    # headers include each other as <SDL3/...> and <SDL3_ttf/...>.
    # the sed-chain is a no-op once vexa master's vexa.pc.in carries them itself
    install -d "$pkgdir/usr/lib/pkgconfig"
    sed \
        -e "s|@PREFIX@|/usr|g" \
        -e "s|@VERSION@|$pkgver|g" \
        packaging/pkgconfig/vexa.pc.in \
        > "$pkgdir/usr/lib/pkgconfig/vexa.pc"
    if ! grep -q 'vexa/vendor/SDL3/include' "$pkgdir/usr/lib/pkgconfig/vexa.pc"; then
        sed -i \
            "s|^Cflags: -I\${includedir}\$|& -I\${includedir}/vexa/vendor/SDL3/include -I\${includedir}/vexa/vendor/SDL3_ttf/include -I\${includedir}/vexa/vendor/tiny-fmt/include|" \
            "$pkgdir/usr/lib/pkgconfig/vexa.pc"
    fi
    grep -q 'vexa/vendor/SDL3/include' "$pkgdir/usr/lib/pkgconfig/vexa.pc"
}
