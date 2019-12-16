_pkgname=nanopb
pkgname=${_pkgname}-git
pkgver=r912.0ffccc4
pkgrel=2
pkgdesc='Protocol Buffers with small code size'
arch=('i686' 'x86_64')
url=https://github.com/nanopb/nanopb
license=('zlib')
depends=()
makedepends=('cmake' 'git')
source=(
    'git+https://github.com/nanopb/nanopb.git'
    'protoc-gen-nanopb'
)
md5sums=(
    'SKIP'
    '7a2b8dc8978e9cc38ec19cc080e3690d'
)

prepare() {
    mkdir -p "${srcdir}/${_pkgname}/build"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/build"

    cmake ..
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/protoc-gen-nanopb" "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/lib/python2.7/proto"
    install -m755 "generator/nanopb_generator.py" "${pkgdir}/usr/lib/python2.7"
    install -m644 "build/nanopb_pb2.py" "${pkgdir}/usr/lib/python2.7/proto"
    touch "${pkgdir}/usr/lib/python2.7/proto/__init__.py"
}
