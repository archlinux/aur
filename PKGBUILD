# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-systemrdl-compiler
_name=${pkgname#python-}
pkgver=1.32.1
pkgrel=1
pkgdesc="Parse and elaborate front-end for SystemRDL 2.0"
provides=(${pkgname})
conflicts=(${pkgname})
arch=($CARCH)
url="https://github.com/SystemRDL/systemrdl-compiler"
_pydeps=(
    antlr4
    colorama
    markdown
    typing_extensions
)
depends=(
    'sh'
    'libgcc_s.so'
    'libstdc++.so'
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=()
options=('!strip' '!lto' '!debug')
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('292aa1abff356ebd48714cd2321141a2a12d20b8f3a03ebcc031d7b34c07ba71')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
