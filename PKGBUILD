# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=psxact-git
pkgver=0.r200.c417dfb
pkgrel=1
pkgdesc="Sony Playstation emulator focused on accuracy"
arch=('x86_64')
url="https://github.com/adam-becker/psxact"
license=('GPL3')
depends=('sdl2')
makedepends=('git')
provides=("${pkgname/%-git/}")
conflicts=("${pkgname/%-git/}")
source=("${pkgname/%-git/}::git+https://github.com/adam-becker/psxact.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname/%-git/}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname/%-git/}"
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir build
}

build() {
    cd "${pkgname/%-git/}"/build
    cmake .. \
        -DCMAKE_BUILD_TYPE='Release'
    make
}

package() {
    cd "${pkgname/%-git/}"
    install -dm 755 "$pkgdir"/usr/{bin,share/{doc,licenses}/"$pkgname"}
    install -m 755 build/psxact "$pkgdir"/usr/bin/
    install -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -m 644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/
}
