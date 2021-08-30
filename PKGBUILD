_pkgname=ericw-tools
pkgname=${_pkgname}-git
pkgver=v0.18.2.rc1.r149.g968a840
pkgrel=1
pkgdesc="Quake/Hexen 2 Map compiling tools"
arch=('x86_64')
url="http://ericwa.github.io/ericw-tools"
_giturl="https://github.com/ericwa/ericw-tools"
license=('GPL3')
depends=('embree' 'groff')
makedepends=('cmake')
conflicts=(${_pkgname})
source=("${_pkgname}::git+${_giturl}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_pkgname}
    # HACK fixes cmake not able to find embree license
    touch light/EMBREE_LICENSE-NOTFOUND
    git submodule update --init --recursive --force
}

build() {
    cd ${_pkgname}
    mkdir build
    cd build
    cmake ..
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

