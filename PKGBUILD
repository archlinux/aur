# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-curated-tokenizers
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Lightweight piece tokenization library"
arch=($CARCH)
url="https://github.com/explosion/curated-tokenizers"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    libgcc
    libstdc++
    python
    python-huggingface-hub
    python-pytest
)
makedepends=(
    'abseil-cpp'
    'cmake'
    'gperftools'
    'protobuf'
    'pybind11'
    git
    cython
    python-regex
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!debug')
source=(
    "${_name}::git+${url}.git#tag=release-v$pkgver"
    "sentencepiece::git+https://github.com/google/sentencepiece.git"
)
noextract=()
sha256sums=('37738d6b3ede828ee3e270067756fd50e61c3b96e41c734d8db11b1e67b2e1dd'
            'SKIP')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's/"cython>=.*"/"cython"/' pyproject.toml
    git submodule init
    git config submodule.sentencepiece.url "$srcdir/sentencepiece"
    git -c protocol.file.allow=always submodule update
}

build() {
    export CFLAGS="-include cstdint $CFLAGS"
    export CXXFLAGS="-include cstdint $CXXFLAGS"

    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
