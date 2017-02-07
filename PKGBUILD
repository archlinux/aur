# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsbag-tools-cl-git'
pkgver=0.16.g44dfe04
pkgrel=1
pkgdesc='RSBag common lisp tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsbag'
license=('LGPL3')
makedepends=('git' 'cmake' 'rsb-proto-stable-git' 'sbcl')
options=("!strip")
source=("rsbag-tools-cl::git+https://code.cor-lab.org/git/rsbag.git.tools-cl"
        "rsbag-cl::git+https://code.cor-lab.org/git/rsbag.git.cl"
        "rsb-tools-cl::git+https://code.cor-lab.org/git/rsb.git.tools-cl"
        "rsb-cl::git+https://code.cor-lab.org/git/rsb.git.cl"
        "cl-protobuf.tar.gz::https://github.com/scymtym/cl-protobuf/archive/release-0.1.tar.gz"
        "network.spread.tar.gz::https://github.com/scymtym/network.spread/archive/release-0.3.1.tar.gz"
        "architecture.builder-protocol.tar.gz::https://github.com/scymtym/architecture.builder-protocol/archive/release-0.5.tar.gz"
        "iterate-sequence::git+https://github.com/scymtym/iterate-sequence")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'c5934f42b3f923564ea2debc207a5a3e'
         '4f548d04ab6a1e86832f266d7276ed4f'
         '8a0bca93913ee772fc9267485659552b'
         'SKIP')

_qlver='2016-10-31'

pkgver() {
    cd "${srcdir}/rsbag-tools-cl"
    printf "%s.%s.g%s" \
        "$(grep version-major rsbag-tools-common.asd | head -n1 | cut -d ' ' -f 3)" \
        "$(grep version-minor rsbag-tools-common.asd | head -n1 | cut -d ' ' -f 3)" \
        "$(git rev-parse --short HEAD)"
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
    cp -R "/usr/share/rsbprotocol0.15/" "${srcdir}/rsbag-cl/data/"

    sbcl \
        --noinform --no-userinit --disable-debugger \
        --load "$(pwd)/quicklisp/setup.lisp" \
        --eval '(ql:quickload (list :esrap :net.didierverna.clon))' \
        --quit
}

build() {
    cd "${srcdir}/rsbag-tools-cl"
    rm -rf build
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVERSION_SUFFIX=-master \
        -DLISP_INIT_CODE="(load \\\"${srcdir}/quicklisp/setup.lisp\\\")" \
        -DLISP_SOURCE_REGISTRY_ENTRIES="(:tree \\\"${srcdir}\\\")" \
        -DLISP_FASL_CACHE_DIR="${srcdir}/cache" \
        -DWITH_YARP_TRANSPORT=OFF \
        -DWITH_ROS_TRANSPORT=OFF ..
    make
}

package() {
    cd "${srcdir}/rsbag-tools-cl/build"
    make DESTDIR="${pkgdir}/" install
}
