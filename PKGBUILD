# Maintainer: SpaghettiToastBook <spaghettitoastbook@pm.me>

pkgname='nod-git'
pkgver=v1.0.r34.g95ed2ae
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
)
md5sums=('SKIP' 'SKIP')

prepare() {
    cd nod
    git config submodule.logvisor.url "$srcdir/logvisor/"
    git submodule update --init
}

pkgver() {
    cd nod
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd nod
    cmake -D CMAKE_INSTALL_PREFIX='/usr' .
}

package() {
    cd nod
    make DESTDIR="$pkgdir/" install
    install -Dm755 driver/nodtool "$pkgdir/usr/bin/nodtool"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/nod/LICENSE"

    cd ../logvisor
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/logvisor/LICENSE"
}