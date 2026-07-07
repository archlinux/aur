# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ctf-dl
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="Command-line tool to download CTF challenges"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/bjornmorten/ctf-dl"
_pydeps=(
    jinja
    httpx
    pydantic
    slugify
    rich
    typer
    yaml
# AUR
    ctfbridge
)
depends=(
    'mdformat'
    'mdformat-tables'
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
optdepends=(
    'python-ctf-sniper: An automated flag submission tool'
    'python-pwnv: A CTF workspace management tool'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('592da6e03f426e95d1448a9e6a87d4198b9c2913564c138c01d8e8589ae335ed')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
