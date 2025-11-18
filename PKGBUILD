# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=core-lightning-git
pkgver=25.09.3.r17147.73147dafe
pkgrel=1
pkgdesc='A lightweight, highly customizable and standard-compliant implementation of the Lightning Network protocol.'
arch=('x86_64')
url='https://github.com/ElementsProject/lightning'
license=('custom')
depends=('gmp' 'libsodium' 'sqlite' 'python-grpcio-tools' 'python-flask' 'python-json5' 'gunicorn' 'python-flask-restx')
makedepends=('clang' 'git' 'python-pytest' 'python-mako' 'mrkd' 'python-poetry')
provides=('python-pyln-client')
source=('git+https://github.com/ElementsProject/lightning.git'
        'git+https://github.com/zserge/jsmn.git'
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        'git+https://github.com/jedisct1/libsodium.git'
        'git+https://github.com/ElementsProject/libwally-core.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd lightning
    _tag=$(git tag --list --sort=taggerdate | tail -n1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    printf $_tag;
    printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd lightning

    sed -e 's/ -Werror//' -i configure

    # To avoid Built-in generator --grpc_python_out specifies a maximum edition 2023 which is not the protoc maximum 2024. 
    # which is a protobuf edition mismatch between protoc and grpc_tools
    sed -i 's/grpc_tools.protoc/grpc_tools.protoc --experimental_editions/g' Makefile contrib/pyln-grpc-proto/Makefile
    python -m grpc_tools.protoc --experimental_editions -I cln-grpc/proto --python_out=contrib/pyln-grpc-proto/pyln/grpc/ --grpc_python_out=contrib/pyln-grpc-proto/pyln/grpc/ cln-grpc/proto/node.proto
}

build() {
    cd lightning

    env CC=clang \
        COPTFLAGS="${CFLAGS}" \
        PYTEST=pytest ./configure --prefix=/usr
    make LDFLAGS="${LDFLAGS}" libexecdir=/usr/lib
    cd contrib/pyln-client
    python -m poetry build --format wheel
}

package() {
    cd lightning

    make DESTDIR="${pkgdir}" libexecdir=/usr/lib install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    python -m installer --destdir="$pkgdir" contrib/pyln-client/dist/*.whl
}
