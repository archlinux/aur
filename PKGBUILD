# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: David Birks <david@birks.dev>

_authorname=batrachianai
_appname=toad
pkgname=${_appname}-ai
pkgver=0.6.14
pkgrel=1
pkgdesc='A unified interface for AI in your terminal'

arch=('any')
url="https://github.com/${_authorname}/${_appname}"
license=('AGPL-3.0-only')

provides=("${_appname}")
conflicts=("${_appname}" "${_authorname}-${_appname}")

depends=('python' 'python-requests' 'python-pygments' 'python-click' 'python-rich' 'python-httpx' 'python-psutil' 'python-textual' 'python-textual-serve' 'python-aiosqlite' 'python-pyperclip' 'python-watchdog' 'python-platformdirs' 'python-setproctitle' 'python-packaging' 'python-pathspec' 'python-typeguard' 'python-xdg-base-dirs' 'python-bashlex')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')

options=('!debug')

source=("https://github.com/${_authorname}/${_appname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c0338aee9a64af09b7ad217723030741c93d2e5dfc317652a3da0f61f63fd6fc775a6773b7e345b9c4c24c747eaa92c08d8c109b5d270d9e20312614445fdb7f')

prepare() {
    cd "${_appname}-${pkgver}"

    sed -i -e 's|requires = \[.*\]|requires = \[\"hatchling\"]|g' "./pyproject.toml"
}
build() {
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
