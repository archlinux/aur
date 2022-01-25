# Maintainer: Paul Davis ("dangersalad") <paul is located at dangersalad and it's a dot com>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=dfhack-twbt
pkgver=0.47.05
_pkgver=$pkgver-r3
_twbtver=v6.61
pkgrel=12
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="https://dfhack.readthedocs.io/en/stable/"
license=('custom')
depends=("dwarffortress=$pkgver" lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama)
provides=('dfhack')
makedepends=('cmake' 'git' 'python-sphinx' 'perl-xml-libxml' 'perl-xml-libxslt')
conflicts=('dfhack-bin' 'dfhack-git' 'dfhack-twbt-bin' 'dfhack')

source=("dfhack::git+https://github.com/DFHack/dfhack#tag=$_pkgver"
        "twbt::git+https://github.com/thurin/df-twbt#branch=04705"
        dfhack.sh
        dfhack-run.sh
        colors.txt
        colors_spring.txt
        colors_summer.txt
        colors_autumn.txt
        colors_winter.txt
        init.txt
        d_init.txt
        dfhack.init
        "graphics.png::https://dwarffortresswiki.org/images/1/11/Bisasam_20x20_mod_T.png"
        "text.png::https://dwarffortresswiki.org/images/a/a6/Cooz_curses_square_16x16.png")

md5sums=('SKIP'
         'SKIP'
         'e74365253ca67a65c49999e5897faa84'
         '0dcc9284c4e52e02e249df23a79c9349'
         'ea2a6ea0f4bfc479fc19d4cc5e27647b'
         '4f1e369137477f7c401c7734023e2b4e'
         'eeef50db09aa05a81fcbebb4d7a10b4b'
         '1c1e4d984c27ab7bef45d6ac8915b5da'
         '9c67fdc314d2344055da0786d984c521'
         'e8bfabc5fe1810fd3a1c91504dce7ee6'
         '84becf98cc341da5806fe0e9406a083a'
         'b72dd69e286287daebb02d748d9c171d'
         'f205514b69112b8e69cef8984b3eb886'
         'f87b8aab62ecb7edf4fd6f2b1c008a3d')

prepare() {
    # shellcheck disable=2154
    cd "$srcdir"/dfhack || exit 1

    git remote set-url origin https://github.com/DFHack/dfhack
    git submodule sync
    git submodule update --init
}

build() {
    cd "$srcdir"/dfhack/build || exit 1

    export CC=gcc
    export CXX=g++

    cmake \
        -DCMAKE_INSTALL_PREFIX=/opt/dwarffortress \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DOCS=ON \
        -DBUILD_STONESENSE=OFF \
        -DDFHACK_BUILD_ARCH=64 \
        ..

    make -j14

    cd "$srcdir"/twbt || exit 1

    make -j14 DFHACKVER="$_pkgver" DF=/opt/dwarffortress DH="$srcdir"/dfhack
    
}

package() {
    cd "$srcdir"/dfhack/build || exit 1

    # shellcheck disable=2154
    make DESTDIR="$pkgdir" install

    install -Dm755 "$srcdir"/dfhack.sh     "$pkgdir"/usr/bin/dfhack
    install -Dm755 "$srcdir"/dfhack-run.sh "$pkgdir"/usr/bin/dfhack-run

    install -Dm644 ../LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    cd "$srcdir"/twbt || exit 1

    mkdir -p "$pkgdir/opt/dwarffortress/hack/plugins"
    
    make DFHACKVER="$_pkgver" DF="$pkgdir/opt/dwarffortress" DH="$srcdir"/dfhack inst

    install -Dm755 "$srcdir/dfhack.init" "$pkgdir/opt/dwarffortress/dfhack.init"
    install -Dm755 dist/shadows.png "$pkgdir/opt/dwarffortress/data/art/shadows.png"
    install -Dm755 dist/white1px.png "$pkgdir/opt/dwarffortress/data/art/white1px.png"
    install -Dm755 dist/transparent1px.png "$pkgdir/opt/dwarffortress/data/art/transparent1px.png"
    install -Dm755 dist/overrides.txt "$pkgdir/opt/dwarffortress/data/init/overrides.txt"
    
    mkdir -p "$pkgdir/opt/dwarffortress/data/init"
    
    install -Dm755 "$srcdir/init.txt" "$pkgdir/opt/dwarffortress/data/init/init.custom.txt"
    install -Dm755 "$srcdir/d_init.txt" "$pkgdir/opt/dwarffortress/data/init/d_init.custom.txt"
    
    mkdir -p "$pkgdir/opt/dwarffortress/data/art"
    
    install -Dm755 "$srcdir/graphics.png" "$pkgdir/opt/dwarffortress/data/art/graphics.png"
    install -Dm755 "$srcdir/text.png" "$pkgdir/opt/dwarffortress/data/art/text.png"
    
    mkdir -p "$pkgdir/opt/dwarffortress/raw"
    
    install -Dm755 "$srcdir/colors.txt" "$pkgdir/opt/dwarffortress/raw/colors.txt"
    install -Dm755 "$srcdir/colors_spring.txt" "$pkgdir/opt/dwarffortress/raw/colors_spring.txt"
    install -Dm755 "$srcdir/colors_summer.txt" "$pkgdir/opt/dwarffortress/raw/colors_summer.txt"
    install -Dm755 "$srcdir/colors_autumn.txt" "$pkgdir/opt/dwarffortress/raw/colors_autumn.txt"
    install -Dm755 "$srcdir/colors_winter.txt" "$pkgdir/opt/dwarffortress/raw/colors_winter.txt"
}
