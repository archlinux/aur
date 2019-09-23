# Maintainer: Marcus Andersson <m.andersson0602 at gmail DOT com>

pkgname=ls-icons
pkgver=v8.27+48+gc5f26413b
pkgrel=1
pkgdesc="A fork of coreutils with a modified ls that print icons"
url="https://github.com/sebastiencs/ls-icons"
arch=('x86_64' 'i686' 'arm')
license=('GPL3')
depends=('icons-in-terminal>=r93.b12286d-3' 'libcap')
makedepends=('git' 'gperf' 'rsync' 'clang')
_patches=('ls-icons-st-term-icons-cutoff-fix.patch')
source=('git://github.com/sebastiencs/ls-icons.git'
        "${_patches[@]}")
sha1sums=('SKIP'
          '4d69c3b01252cfbb5d42e62546d96ac11daa14a1')

provides=('ls-icons')
conflicts=('ls-icons')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags | sed 's/_/./g;s/-/+/g' 
}

prepare() {
    cd "$srcdir/$pkgname"

    sed -i 's DATA="${DATA}/icons-in-terminal/" DATA="/usr/share/icons-in-terminal" ' bootstrap
    ./bootstrap

    # potential fix if icons are cropped
    #local file
    #for file in "${_patches[@]}"; do
    #    echo "Applying patch $(basename $file)..."
    #    patch -Np1 <"$srcdir/$(basename $file)"
    #done

    # Execute this line _only_ if your terminal doesn't support true colours
    # https://gist.github.com/XVilka/8346728#now-supporting-truecolour
    #export CFLAGS=-DNO_TRUE_COLOURS=1

    export CC=clang CXX=clang++
    ./configure
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "src/ls"   "$pkgdir/usr/bin/ls-icons"
    install -Dm755 "src/dir"  "$pkgdir/usr/bin/dir-icons"
    install -Dm755 "src/vdir" "$pkgdir/usr/bin/vdir-icons"
}
