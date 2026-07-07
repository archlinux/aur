# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ctfbridge
_name=${pkgname#python-}
pkgver=0.8.9
pkgrel=1
pkgdesc="A Python library for interacting with multiple CTF platforms"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/bjornmorten/ctfbridge"
_pydeps=(
    asyncssh
    beautifulsoup4
    httpx
    markdownify
    pydantic
    rich
    typer
)
depends=(
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
    'python-ctf-dl: A CTF challenge bulk downloader'
    'python-ctf-sniper: An automated flag submission tool'
    'python-pwnv: A CTF workspace management tool'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('a265577a9dc9dad3d35973ebbe9586915e180dcf149868c639db1054595197df')

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
