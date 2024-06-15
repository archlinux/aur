# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=asgi-webdav
_pipname=ASGIWebDAV
pkgname="python-${_pkgname}"
pkgver=1.4.0
pkgrel=1
pkgdesc="An asynchronous WebDAV server implementation, Support multi-provider, multi-account and permission control."
arch=("any")
url="https://github.com/rexzhang/${_pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=("python-aiofiles" "python-arrow" "python-asgi-middleware-static-file" "python-chardet" "python-click" "python-pydantic" "python-xmltodict")
source=("${_pipname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/dd/fb/bd8ddceee111f97605bbf60f9d3fa286640173b06772298fc57f12c4820c/${_pipname}-${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.user.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        config.json)
sha256sums=('7b1baeddd63440772f6ad3bd62f9f2545286d4d5a0b4e3c548a805ecdefe4206'
            '6c23a7ba4181d929419b4d1557a3660bd99dd9d384b6da6e9013dc6b71f89099'
            '9960f00c5adf1ebc08e04adccc9b6c25eceecd74352ec49e96b03bbee31f1521'
            'd230496ce61436b709d34078273df5e4b6036eab316b5c9f54f5d261a5c61ea8'
            'a1bc83acb2b0429b4aef7b1bda3a5c0b19312ef4b6680040cc81b34e233e469c'
            '1245fc95c3cbc5d36ec7e21d426e618e3cd015361ac0a2f8834351c334511867')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "${_pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 config.json                "${pkgdir}/etc/${_pkgname}/config.json"

    cd "${_pipname}-${pkgver}"
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
