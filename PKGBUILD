# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=faustpp
pkgname="${_pkgname}-git"
pkgver=r57.5197306
pkgrel=1
pkgdesc="A post-processor for FAUST DSP code (git version)"
arch=('x86_64')
url="https://github.com/jpcima/faustpp"
license=('Boost')
depends=('glibc' 'gcc-libs' 'boost-libs')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jpcima/faustpp.git"
        'jinja2cpp::git+https://github.com/jinja2cpp/Jinja2Cpp.git'
        'git+https://github.com/martinmoene/optional-lite.git'
        'git+https://github.com/martinmoene/variant-lite.git'
        'git+https://github.com/martinmoene/string-view-lite.git'
        'git+https://github.com/martinmoene/expected-lite.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/Tencent/rapidjson.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule set-url thirdparty/jinja2cpp "${srcdir}/jinja2cpp"
  git submodule set-url thirdparty/optional-lite "${srcdir}/optional-lite"
  git submodule set-url thirdparty/variant-lite "${srcdir}/variant-lite"
  git submodule set-url thirdparty/string-view-lite "${srcdir}/string-view-lite"
  git submodule set-url thirdparty/expected-lite "${srcdir}/expected-lite"
  git submodule set-url thirdparty/fmt "${srcdir}/fmt"
  git submodule set-url thirdparty/rapidjson "${srcdir}/rapidjson"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  (
    cd build;
    make DESTDIR="${pkgdir}" install;
  )
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
