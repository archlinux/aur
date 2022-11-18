pkgname=tray-control
pkgver=r10.08a0ff9
pkgrel=1
arch=('x86_64')

depends=('systemd-libs'
         'fmt'
         'sdbus-cpp')

makedepends=('git')

pkgdesc="Simple CLI tool to show items in systray and activate them. Build on top of DBus"

url="https://github.com/andrewerf/tray-control"

source=('git+https://github.com/andrewerf/tray-control.git'
        'git+https://github.com/Neargye/magic_enum.git'
        'git+https://github.com/jarro2783/cxxopts.git')

md5sums=('SKIP'
         'SKIP'
         'SKIP')

license=('GPL3')


pkgver(){
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd $pkgname
    git submodule init
    git config submodule.magic_enum.url 3rdparty/magic_enum
    git config submodule.cxxopts.url 3rdparty/cxxopts
    git submodule update --init
}

build() {
    cd $pkgname
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd $pkgname/build
    DESTDIR="$pkgdir/" cmake --install .
}
