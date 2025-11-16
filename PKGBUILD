_pkgname=ericw-tools
pkgname=${_pkgname}-git
pkgver=2.0.0.alpha10.r19.g9a12f5f3
pkgrel=1
pkgdesc="Quake/Hexen 2 Map compiling tools"
arch=('x86_64')
url="https://ericwa.github.io/ericw-tools"
_giturl="https://github.com/ericwa/ericw-tools"
license=('GPL3')
depends=('embree' 'groff' 'tbb' 'qt6-base')
makedepends=('cmake' 'git' 'python-sphinx' 'python-sphinx-furo' 'python-sphinx-autobuild')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${_giturl}.git"
    "fmt::git+https://github.com/fmtlib/fmt.git"
    "nanobench::git+https://github.com/martinus/nanobench"
    "pareto::git+https://github.com/alandefreitas/pareto.git"
    "jsoncpp::git+https://github.com/open-source-parsers/jsoncpp"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_pkgname
    git config submodule.lib/fmt.url ../fmt
    git config submodule.3rdparty/nanobench.url ../nanobench
    git config submodule.3rdparty/pareto.url ../pareto
    git config submodule.3rdparty/jsoncpp.url ../jsoncpp
    git submodule update
}

build() {
    cmake -S ${_pkgname} -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    _files=(qbsp vis light bspinfo bsputil maputil lightpreview)
    for _i in "${_files[@]}"
    do
      install -Dm755 build/${_i}/${_i} "$pkgdir"/usr/bin/${_i}
    done
    
    cd build/docs/docs/sphinx/
    rm -r .doctrees/ .buildinfo
    find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/share/doc/${_pkgname}/{} \;
}

