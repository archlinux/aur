# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=sciplot
pkgver=0.3.1
pkgrel=1
epoch=1
pkgdesc='C++ scientific plotting library powered by gnuplot'
arch=('any')
url='https://github.com/sciplot/sciplot/'
license=('MIT')
depends=('gnuplot')
makedepends=('git' 'cmake' 'catch2-v2')
source=("git+https://github.com/sciplot/sciplot.git#tag=v${pkgver}"
        'git+https://github.com/allanleal/doxystrap.git'
        'git+https://github.com/sciplot/gnuplot-palettes.git')
sha256sums=('04014bb72c8727f562fc331581bbd1cabf5236665fa8661497ef5a5cb08d083f'
            'SKIP'
            'SKIP')

prepare() {
    git -C sciplot submodule init
    git -C sciplot config --local submodule.deps/doxystrap.url "${srcdir}/doxystrap"
    git -C sciplot config --local submodule.deps/gnuplot-palettes.url "${srcdir}/gnuplot-palettes"
    git -C sciplot -c protocol.file.allow='always' submodule update
    cp -f /usr/include/catch2/catch.hpp sciplot/tests
}

build() {
    cmake -B build -S sciplot \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSCIPLOT_BUILD_DOCS:BOOL='OFF' \
        -DSCIPLOT_BUILD_EXAMPLES:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 sciplot/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
