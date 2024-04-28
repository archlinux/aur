pkgname=json-stroller-git
pkgver=1.2.r0.g787cbc5
pkgrel=1
pkgdesc="view json files and display differences between json formatted data"
arch=('x86_64')
url="https://github.com/isundil/jsonStroller"
license=('GPL-3.0-or-later')
depends=('ncurses')
makedepends=('cmake' 'git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g;'
}

prepare() {
    cd $pkgname
    # fix cmake warnings
    sed -i -e '2iproject(jsonstroller)' -e 's/2.8/3.5/' CMakeLists.txt
}

build() {
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -B build -S $pkgname
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
