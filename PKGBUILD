# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: David Birks <david@birks.dev>

_authorname=batrachianai
_appname=toad
pkgname=${_appname}-ai
pkgver=0.6.17
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
b2sums=('b0bf95d6af576666008cdb6992a72ccb30751c8a6c39f1b4209d0332c7e7a1db8eefea7258df3ae7848ac5be271d9d61a4f23ed59e9f90fa8968aa22ec7f95fe')

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
