pkgname=sparforte-git
pkgver=2.6.3.r0.gafe5cfcb
pkgrel=1

pkgdesc='shell and scripting language formally known as bush'
url='http://www.sparforte.com'
arch=('i686' 'x86_64')
license=('GPL')

depends=('readline' 'postgresql-libs' 'pcre')
makedepends=('git' 'gcc-ada')

provides=('sparforte')
conflicts=('sparforte')

source=('git+https://github.com/kburtch/SparForte'
        'add-gnatdE-flag.patch'
        'config.linux')

sha256sums=('SKIP'
            'd9beec2bd909b89d42d3ee64c531be6b77640c6d5565b1bd67f787299d6fc05f'
            '2f81bc743387d672cb1278fbd027568210ad51d8653a34ac1765dcb5756ca12e')

pkgver() {
    cd SparForte
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cd SparForte
    cp -f -- "$srcdir"/config.linux config.linux
    patch -Np1 -i "$srcdir"/add-gnatdE-flag.patch
}

build() {
    cd SparForte
    ./config.linux
    make
}

check() {
    cd SparForte
    make test
}

package() {
    cd SparForte
    # The makefile only honours DESTDIR when RPM_BUILD_ROOT is set.
    make RPM_BUILD_ROOT=1 DESTDIR="$pkgdir" install

    # Removing this directory makes it easier to use install(1)'s -t flag.
    rm -rf -- examples/incomplete

    # The htmls are just duplicates of the .sp scripts
    rm -f -- examples/*.html examples/scripting.c
    install -Dm0644 examples/* -t "$pkgdir"/usr/share/"$pkgname"/examples
}
