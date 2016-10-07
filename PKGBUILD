# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-tools-cl'
pkgver=0.14.7.2f7d3f2
pkgrel=1
pkgdesc='Robotics Service Bus common lisp tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('spread-daemon')
makedepends=('git' 'cmake' 'rsc' 'rsb-proto' 'sbcl')
options=("!strip")
source=("rsb-tools-cl::git+https://code.cor-lab.org/git/rsb.git.tools-cl#branch=0.14"
        "rsb-cl::git+https://code.cor-lab.org/git/rsb.git.cl#branch=0.14"
        "cl-protobuf::git+https://github.com/scymtym/cl-protobuf"
        "network.spread::git+https://github.com/scymtym/network.spread"
        "architecture.builder-protocol::git+https://github.com/scymtym/architecture.builder-protocol")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

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
        sbcl --noinform --no-userinit --disable-debugger --load quicklisp.lisp --eval '(quicklisp-quickstart:install :path "'$(pwd)'/quicklisp")' --quit
    fi
    echo "\"/usr/share/rsbprotocol0.14/\"" > "${srcdir}/rsb-cl/protocol-directory.sexp"
}

build() {
    cd "${srcdir}/rsb-tools-cl"
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
