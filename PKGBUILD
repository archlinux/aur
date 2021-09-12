_pkgname=ericw-tools
pkgname=${_pkgname}-git
pkgver=0.18.2.rc1.r166.gac79487
pkgrel=1
pkgdesc="Quake/Hexen 2 Map compiling tools"
arch=('x86_64')
url="https://ericwa.github.io/ericw-tools"
_giturl="https://github.com/ericwa/ericw-tools"
license=('GPL3')
depends=('embree' 'groff')
makedepends=('cmake' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${_giturl}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_pkgname}
    git submodule update --init --recursive --force
}

build() {
    cd ${_pkgname}
    rm -rf build
    mkdir build
    cd build
    cmake ..
    # HACK fixes cmake not able to copy embree license
    touch light/EMBREE_LICENSE-NOTFOUND
    make
}

package() {
    _files=(qbsp vis light bspinfo bsputil)
    for _i in "${_files[@]}"
    do
      install -Dm755 ${_pkgname}/build/${_i}/${_i} "$pkgdir"/usr/bin/${_i}
      install -Dm644 ${_pkgname}/build/man/${_i}.html -t "${pkgdir}"/usr/share/doc/${_pkgname}
    done
}

