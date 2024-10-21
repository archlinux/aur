# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=asgi-webdav
_pipname=ASGIWebDAV
pkgname="python-${_pkgname}"
pkgver=1.4.1
pkgrel=1
pkgdesc="An asynchronous WebDAV server implementation, Support multi-provider, multi-account and permission control."
arch=("any")
url="https://github.com/rexzhang/${_pkgname}"
license=('MIT')
backup=("etc/${_pkgname}/config.json")
install="${_pkgname}.install"
depends=("python-aiofiles" "python-arrow" "python-asgi-middleware-static-file" "python-chardet" "python-click" "python-pydantic" "python-xmltodict")
optdepends=("python-bonsai: LDAP support"
            "python-brotli: response compress support")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.user.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        config.json)
sha256sums=('735a3fd098c7bf8b923a27996868a8b8f19d450cf16598d189443a6c32512699'
            '6c23a7ba4181d929419b4d1557a3660bd99dd9d384b6da6e9013dc6b71f89099'
            '9960f00c5adf1ebc08e04adccc9b6c25eceecd74352ec49e96b03bbee31f1521'
            'd230496ce61436b709d34078273df5e4b6036eab316b5c9f54f5d261a5c61ea8'
            'a1bc83acb2b0429b4aef7b1bda3a5c0b19312ef4b6680040cc81b34e233e469c'
            'd10c0e9cafc0e1df19a842d78b0e6d537369752ee00e3d33c87ae8579b3d336c')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "${_pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 config.json                "${pkgdir}/etc/${_pkgname}/config.json"

    cd "${_pkgname}-${pkgver}"
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
