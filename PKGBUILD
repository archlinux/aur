# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-aerospike
_name=${pkgname#python-}
pkgver=19.2.1
pkgrel=1
pkgdesc="Aerospike Client Library for Python"
provides=(${pkgname})
conflicts=(${pkgname})
arch=($CARCH)
url="https://github.com/aerospike/aerospike-client-python"
depends=(
    glibc
    libyaml
    openssl
    zlib
    python
)
_pymakedeps=(
    versioningit
    parver
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    "${_pymakedeps[@]/#/python-}"
)
optdepends=()
license=('Apache-2.0')
source=(
    "${_name}::git+${url}.git#tag=$pkgver"
    "aerospike-client-c::git+https://github.com/aerospike/aerospike-client-c.git"
    "common::git+https://github.com/aerospike/aerospike-common.git"
    "mod-lua::git+https://github.com/aerospike/aerospike-mod-lua.git"
    "lua::git+https://github.com/aerospike/lua.git"
)
sha256sums=('b6f06a236d96601b074c31eb168b864859884a27ccd34ed50802c5f5eb51464a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd ${srcdir}/${_name}
    sed -i -E '/versioningit|parver/s/==[0-9][^"]*//' pyproject.toml
    git submodule init
    git config submodule.aerospike-client-c.url "$srcdir/aerospike-client-c"
    git -c protocol.file.allow=always submodule update
    cd ${srcdir}/${_name}/aerospike-client-c
    git submodule init
    git config submodule.modules/common.url "$srcdir/common"
    git config submodule.modules/mod-lua.url "$srcdir/mod-lua"
    git config submodule.modules/lua.url "$srcdir/lua"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
