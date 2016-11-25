# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-tools-cl-stable-git'
pkgver=0.15.0.b596630
pkgrel=2
pkgdesc='Robotics Service Bus common lisp tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('spread-daemon')
makedepends=('git' 'cmake' 'rsb-proto-stable-git' 'sbcl')
options=("!strip")
source=("rsb-tools-cl::git+https://code.cor-lab.org/git/rsb.git.tools-cl#branch=0.15"
        "rsb-cl::git+https://code.cor-lab.org/git/rsb.git.cl#branch=0.15"
        "cl-protobuf.tar.gz::https://github.com/scymtym/cl-protobuf/archive/release-0.1.tar.gz"
        "network.spread.tar.gz::https://github.com/scymtym/network.spread/archive/release-0.2.1.tar.gz"
        "architecture.builder-protocol.tar.gz::https://github.com/scymtym/architecture.builder-protocol/archive/release-0.5.tar.gz")
md5sums=('SKIP'
         'SKIP'
         'c5934f42b3f923564ea2debc207a5a3e'
         '90626c3382e5704084f2df383662baa3'
         '8a0bca93913ee772fc9267485659552b')
conflicts=('rsb-tools-cl')
provides=('rsb-tools-cl')

_qlver='2016-10-31'

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

    echo "\"/usr/share/rsbprotocol0.15/\"" > "${srcdir}/rsb-cl/protocol-directory.sexp"
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
