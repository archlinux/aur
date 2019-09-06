# Maintainer: SpaghettiToastBook <spaghettitoastbook@pm.me>

pkgname='nod-git'
pkgver=v1.0.r74.g97cfcea
pkgrel=1
pkgdesc='Tool for traversing, dumping, and authoring GameCube and Wii disc images'
arch=('x86_64')
url='https://gitlab.axiodl.com/AxioDL/nod'
license=('MIT')
makedepends=('cmake' 'git')
provides=('nod')
conflicts=('nod')
source=(
    'nod::git+https://gitlab.axiodl.com/AxioDL/nod.git'
    'logvisor::git+https://gitlab.axiodl.com/AxioDL/logvisor.git'
    'fmt::git+https://github.com/fmtlib/fmt.git'
)
md5sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir/logvisor"
    git config submodule.fmt.url "$srcdir/fmt/"
    git submodule update --init

    cd "$srcdir/nod"
    git config submodule.logvisor.url "$srcdir/logvisor/"
    git submodule update --init --recursive
}

pkgver() {
    cd "$srcdir/nod"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/nod"
    cmake -D CMAKE_INSTALL_PREFIX='/usr' .
}

package() {
    cd "$srcdir/nod"
    make DESTDIR="$pkgdir/" install
    install -Dm755 driver/nodtool "$pkgdir/usr/bin/nodtool"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/nod/LICENSE"

    cd "$srcdir/logvisor"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/logvisor/LICENSE"

    cd "$srcdir/fmt"
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/fmt/LICENSE.rst"
}