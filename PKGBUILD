# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-tools-cl-stable-git'
pkgver=0.16.0.2335104
_branch=0.16
pkgrel=2
pkgdesc='Robotics Service Bus common lisp tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('spread-daemon')
makedepends=('git' 'cmake' 'rsb-proto-stable-git' 'sbcl')
options=("!strip")
source=("rsb-tools-cl::git+https://code.cor-lab.org/git/rsb.git.tools-cl#branch=${_branch}"
        "rsb-cl::git+https://code.cor-lab.org/git/rsb.git.cl#branch=${_branch}"
        "cl-protobuf.tar.gz::https://github.com/scymtym/cl-protobuf/archive/release-0.1.tar.gz"
        "network.spread.tar.gz::https://github.com/scymtym/network.spread/archive/release-0.3.tar.gz"
        "log4cl::git+https://github.com/sharplispers/log4cl") # can probably be removed with the next RSB release
md5sums=('SKIP'
         'SKIP'
         'c5934f42b3f923564ea2debc207a5a3e'
         'ac0928126553de74e8b42b512b33eacc'
         'SKIP')
conflicts=('rsb-tools-cl')
provides=('rsb-tools-cl')

_qlver='2017-04-03'

pkgver() {
    cd "${srcdir}/rsb-tools-cl"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}"
    if ! [ -f quicklisp/setup.lisp ]
    then
        mkdir -p quicklisp
        curl -O http://beta.quicklisp.org/quicklisp.lisp
        sbcl \
            --noinform --no-userinit --disable-debugger \
            --load quicklisp.lisp \
            --eval '(quicklisp-quickstart:install
                     :dist-version "quicklisp/'"${_qlver}"'"
                     :path         "'"$(pwd)"'/quicklisp")' \
            --quit
    fi

    echo "\"/usr/share/rsbprotocol${_branch}/\"" > "${srcdir}/rsb-cl/protocol-directory.sexp"
}

build() {
    cd "${srcdir}/rsb-tools-cl"
    rm -rf build
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLISP_INIT_CODE="(load \\\"${srcdir}/quicklisp/setup.lisp\\\")" \
        -DLISP_SOURCE_REGISTRY_ENTRIES="(:tree \\\"${srcdir}\\\")" \
        -DLISP_FASL_CACHE_DIR="${srcdir}/cache" \
        -DWITH_YARP_TRANSPORT=OFF \
        -DWITH_ROS_TRANSPORT=OFF ..
    make
}

package() {
    cd "${srcdir}/rsb-tools-cl/build"
    make DESTDIR="${pkgdir}/" install
}
