_pkgname=ericw-tools
pkgname=${_pkgname}-git
pkgver=0.18.2.rc1.r2115.g9f7ba657
pkgrel=1
pkgdesc="Quake/Hexen 2 Map compiling tools"
arch=('x86_64')
url="https://ericwa.github.io/ericw-tools"
_giturl="https://github.com/ericwa/ericw-tools"
license=('GPL3')
depends=('embree3' 'groff' 'tbb')
makedepends=('cmake' 'git' 'python-sphinx' 'python-sphinx-furo')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${_giturl}.git#branch=brushbsp"
    "fmt::git+https://github.com/fmtlib/fmt.git"
    "json::git+https://github.com/ArthurSonzogni/nlohmann_json_cmake_fetchcontent.git"
    "nanobench::git+https://github.com/martinus/nanobench"
    "pareto::git+https://github.com/alandefreitas/pareto.git"
    "doctest::git+https://github.com/doctest/doctest"
)
sha256sums=('SKIP'
            'SKIP'
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
    git config submodule.3rdparty/json.url ../json
    git config submodule.3rdparty/nanobench.url ../nanobench
    git config submodule.3rdparty/pareto.url ../pareto
    git config submodule.3rdparty/doctest.url ../doctest
    git submodule update
}

build() {
    cmake -S ${_pkgname} -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    _files=(qbsp vis light bspinfo bsputil)
    for _i in "${_files[@]}"
    do
      install -Dm755 build/${_i}/${_i} "$pkgdir"/usr/bin/${_i}
    done
    
    cd build/docs/docs/sphinx/
    rm -r .doctrees/ .buildinfo
    find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/share/doc/${_pkgname}/{} \;
}

