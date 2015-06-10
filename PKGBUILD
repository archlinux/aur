# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=tasknc
pkgname=taskwarrior-${_pkgname}-git
pkgver=20130227.r546.1274698
pkgrel=3
pkgdesc="a ncurses wrapper around taskwarrior"
url="https://github.com/mjheagle8/${_pkgname}"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('task' 'perl')
makedepends=('git' 'cmake')
replaces=("${_pkgname}-git")
conflicts=("${_pkgname}-git")
provides=("${_pkgname}-git")
source=("git://github.com/mjheagle8/${_pkgname}.git#branch=master"
        "${_pkgname}-build_fix.patch"
        "${_pkgname}-sync_fix.patch"
        "${_pkgname}-man_cleanup.patch"
        "${_pkgname}-emptyfilter_fix.patch")
sha512sums=('SKIP'
            'b0297b2526b9bbef296f0a67f0209bfe85fd15f714701534f29ed85cd7da5bd3ca16d6457ee2859ee074b8ccf2db73cf46eb492c89953bac91d4778f823cb3cc'
            'af3d5cd6e6277b5be1b50bfbe4549c0db195f8a1a7dd07285140448326a380674331fb3e283b84fe992150d428d0200d2c9376342137f356b7edfcaf150fd8aa'
            '5dfeb7c7732c9490010b22628e8012414c3dd96ecb98540d826b306cc1b4731b2055bdb180e012534ec642b19fbd735ad9782cb43ea39381f662c38aa777bdfe'
            'f105652d6235d77a277105c92097d9f552c1bb988cdc72c621bb2264b60b97ff3fcf50ed967467ca06f50fd7120007cee232e3dfb021a373cb09f38340e082b2')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    patch -p1 < ../${_pkgname}-build_fix.patch
    patch -p1 < ../${_pkgname}-sync_fix.patch
    patch -p1 < ../${_pkgname}-man_cleanup.patch
    patch -p1 < ../${_pkgname}-emptyfilter_fix.patch
}

build() {
    cd $_pkgname
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

package() {
    cd ${_pkgname}/build
    make DESTDIR="$pkgdir" install
}
