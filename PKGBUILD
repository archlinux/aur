# Mantainer: Alberto Santini <alberto dot santini at upf dot edu>

pkgname='pmc-git'
pkgdesc='Parallel Maximum Clique tool and library'

pkgver='r20.06594a0'
pkgrel='1'

arch=('x86_64')
url='https://github.com/ryanrossi/pmc'
license=('GPL3')

source=('git+https://github.com/ryanrossi/pmc.git'
        'pmc_utils.cpp.patch')
sha256sums=('SKIP'
            'dedbe24cbc8d42cab01d712a20af177ab070bd4f0bc566163b695623d509c274')

_pmc_utils_sum='abd6690e83d7e3bc7154e3c7c7d899d05027e69de6bb74b65b6a8edfe339f91c'

pkgver() {
  cd "$srcdir/pmc"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "$srcdir/pmc"

    _current_sum=$(sha256sum "$srcdir/pmc/pmc_utils.cpp" | awk '{ print $1 }')

    if [[ "$_current_sum" = "$_pmc_utils_sum" ]]; then
        patch < "$srcdir/pmc_utils.cpp.patch"
    fi
}

build() {
    cd "$srcdir/pmc"
    make
    make libpmc.so
}

check() {
    cd "$srcdir/pmc"
    make libpmc_test
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/pmc/pmc" "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/usr/lib"
    install -m755 "$srcdir/pmc/libpmc.so" "$pkgdir/usr/lib"

    install -dm755 "$pkgdir/usr/include"
    install -m644 "$srcdir/pmc/libpmc.h" "$pkgdir/usr/include"

    install -dm755 "$pkgdir/usr/share/doc/pmc-git"
    install -m644 "$srcdir/pmc/README.md" "$pkgdir/usr/share/doc/pmc-git"
}