pkgname=sparforte-git
pkgver=2.1.r181.g8feee7e
pkgrel=1

pkgdesc='shell and scripting language formally known as bush'
url='http://www.sparforte.com'
arch=('i686' 'x86_64')
license=('GPL')

depends=('sdl_image' 'glu' 'readline' 'postgresql-libs')
makedepends=('git' 'gcc-ada')

provides=('sparforte')
conflicts=('sparforte')

source=('git+https://github.com/kburtch/SparForte'
        'config.linux')

sha256sums=('SKIP'
            '6c7539230e5b0542154e5943ae3be2b244477b4929ad20f75a2e052517bae656')

pkgver() {
    cd SparForte
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cp -f config.linux SparForte/config.linux
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
